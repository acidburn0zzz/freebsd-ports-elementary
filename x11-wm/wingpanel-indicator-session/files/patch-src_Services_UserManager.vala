--- src/Services/UserManager.vala.orig	2020-04-01 23:50:50 UTC
+++ src/Services/UserManager.vala
@@ -41,12 +41,12 @@ public class Session.Services.UserManager : Object {
     public Wingpanel.Widgets.Separator users_separator { get; construct; }
 
     private const uint GUEST_USER_UID = 999;
-    private const uint NOBODY_USER_UID = 65534;
-    private const uint RESERVED_UID_RANGE_END = 1000;
+    // According to pw.conf(5)
+    private const uint MAX_USER_UID = 32000;
+    private const uint MIN_USER_UID = 1000;
 
     private const string DM_DBUS_ID = "org.freedesktop.DisplayManager";
-    private const string LOGIN_IFACE = "org.freedesktop.login1";
-    private const string LOGIN_PATH = "/org/freedesktop/login1";
+    private const string CK_IFACE = "org.freedesktop.ConsoleKit";
 
     private Act.UserManager manager;
     private Gee.HashMap<uint, Widgets.Userbox>? user_boxes;
@@ -56,36 +56,38 @@ public class Session.Services.UserManager : Object {
 
     static construct {
         try {
-            login_proxy = Bus.get_proxy_sync (BusType.SYSTEM, LOGIN_IFACE, LOGIN_PATH, DBusProxyFlags.NONE);
+            login_proxy = Bus.get_proxy_sync (BusType.SYSTEM,
+                                              CK_IFACE,
+                                              "/org/freedesktop/ConsoleKit/Manager",
+                                              DBusProxyFlags.NONE);
         } catch (IOError e) {
-            critical ("Failed to create login1 dbus proxy: %s", e.message);
+            critical ("Failed to create ConsoleKit2 dbus proxy: %s",
+                      e.message);
         }
     }
 
     public static UserState get_user_state (uint32 uuid) {
-        if (login_proxy == null) {
-            return UserState.OFFLINE;
-        }
-
         try {
-            UserInfo[] users = login_proxy.list_users ();
-            if (users == null) {
-                return UserState.OFFLINE;
-            }
-
-            foreach (UserInfo user in users) {
-                if (user.uid == uuid) {
-                    if (user.user_object == null) {
-                        return UserState.OFFLINE;
+            GLib.ObjectPath[] sessions = login_proxy.get_sessions ();
+            foreach (GLib.ObjectPath session in sessions) {
+                try {
+                    UserInterface? user_interface = GLib.Bus.get_proxy_sync (GLib.BusType.SYSTEM, CK_IFACE, session.to_string ());
+                    if (user_interface != null) {
+                        if (user_interface.get_session_class () == "user") {
+                            string state = user_interface.get_session_state ();
+                            return UserState.to_enum (state);
+                        }
+                        else {
+                            return UserState.OFFLINE;
+                        }
                     }
-                    UserInterface? user_interface = Bus.get_proxy_sync (BusType.SYSTEM, LOGIN_IFACE, user.user_object, DBusProxyFlags.NONE);
-                    if (user_interface == null) {
+                    else {
                         return UserState.OFFLINE;
                     }
-                    return UserState.to_enum (user_interface.state);
+                } catch (GLib.Error e) {
+                    critical ("Error: %s", e.message);
                 }
             }
-
         } catch (GLib.Error e) {
             critical ("Failed to get user state: %s", e.message);
         }
@@ -94,23 +96,7 @@ public class Session.Services.UserManager : Object {
     }
 
     public static UserState get_guest_state () {
-        if (login_proxy == null) {
-            return UserState.OFFLINE;
-        }
-
-        try {
-            UserInfo[] users = login_proxy.list_users ();
-            foreach (UserInfo user in users) {
-                var state = get_user_state (user.uid);
-                if (user.user_name.has_prefix ("guest-")
-                    && state == UserState.ACTIVE) {
-                    return UserState.ACTIVE;
-                }
-            }
-        } catch (GLib.Error e) {
-            critical ("Failed to get Guest state: %s", e.message);
-        }
-
+        // Not yet implemented
         return UserState.OFFLINE;
     }
 
@@ -139,6 +125,7 @@ public class Session.Services.UserManager : Object {
         });
 
         var seat_path = Environment.get_variable ("XDG_SEAT_PATH");
+        var session_path = Environment.get_variable ("XDG_SESSION_PATH");
 
         if (seat_path != null) {
             try {
@@ -150,6 +137,24 @@ public class Session.Services.UserManager : Object {
                 critical ("UserManager error: %s", e.message);
             }
         }
+
+        if (dm_proxy != null) {
+            user_grid.switch_to_guest.connect (() => {
+                try {
+                    dm_proxy.switch_to_guest ("");
+                } catch (Error e) {
+                    warning ("Error switching to guest account: %s", e.message);
+                }
+            });
+
+            user_grid.switch_to_user.connect ((username) => {
+                try {
+                    dm_proxy.switch_to_user (username, session_path);
+                } catch (Error e) {
+                    warning ("Error switching to user '%s': %s", username, e.message);
+                }
+            });
+        }
     }
 
     private void init_users () {
@@ -165,7 +170,7 @@ public class Session.Services.UserManager : Object {
     private void add_user (Act.User? user) {
         // Don't add any of the system reserved users
         var uid = user.get_uid ();
-        if (uid < RESERVED_UID_RANGE_END || uid == NOBODY_USER_UID || user_boxes.has_key (uid)) {
+        if (uid < MIN_USER_UID || uid >= MAX_USER_UID || user_boxes.has_key (uid)) {
             return;
         }
 
@@ -196,7 +201,7 @@ public class Session.Services.UserManager : Object {
     }
 
     public void update_all () {
-        foreach (var userbox in user_boxes) {
+        foreach (var userbox in user_boxes.values) {
             userbox.update_state ();
         }
     }
