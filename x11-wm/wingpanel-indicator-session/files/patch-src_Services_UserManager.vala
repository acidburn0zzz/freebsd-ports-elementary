--- src/Services/UserManager.vala.orig	2021-07-13 23:28:32 UTC
+++ src/Services/UserManager.vala
@@ -41,12 +41,12 @@ public class Session.Services.UserManager : Object {
     public Session.Widgets.UserListBox user_grid { get; private set; }
 
     private const uint GUEST_USER_UID = 999;
-    private const uint NOBODY_USER_UID = 65534;
+    private const uint NOBODY_USER_UID = 32000; // See pw.conf(5)
     private const uint RESERVED_UID_RANGE_END = 1000;
 
     private const string DM_DBUS_ID = "org.freedesktop.DisplayManager";
-    private const string LOGIN_IFACE = "org.freedesktop.login1";
-    private const string LOGIN_PATH = "/org/freedesktop/login1";
+    private const string LOGIN_IFACE = "org.freedesktop.ConsoleKit";
+    private const string LOGIN_PATH = "/org/freedesktop/ConsoleKit/Manager";
 
     private Act.UserManager manager;
     private Gee.HashMap<uint, Widgets.Userbox>? user_boxes;
@@ -62,7 +62,7 @@ public class Session.Services.UserManager : Object {
         try {
             login_proxy = yield Bus.get_proxy (BusType.SYSTEM, LOGIN_IFACE, LOGIN_PATH, DBusProxyFlags.NONE);
         } catch (IOError e) {
-            critical ("Failed to create login1 dbus proxy: %s", e.message);
+            critical ("Failed to create ConsoleKit2 dbus proxy: %s", e.message);
         }
     }
 
@@ -72,21 +72,26 @@ public class Session.Services.UserManager : Object {
         }
 
         try {
-            UserInfo[] users = login_proxy.list_users ();
-            if (users == null) {
+            GLib.ObjectPath[] sessions = login_proxy.get_sessions ();
+            if (sessions == null) {
                 return UserState.OFFLINE;
             }
 
-            foreach (UserInfo user in users) {
-                if (user.uid == uuid) {
-                    if (user.user_object == null) {
+            foreach (GLib.ObjectPath session in sessions) {
+                UserInterface? user_interface = yield Bus.get_proxy (BusType.SYSTEM,
+                                                                     LOGIN_IFACE,
+                                                                     session,
+                                                                     DBusProxyFlags.NONE);
+                if (user_interface == null) {
+                    return UserState.OFFLINE;
+                }
+                uint32 uid = user_interface.get_unix_user ();
+
+                if (uid == uuid) {
+                    if (user_interface.get_session_class () != "user") {
                         return UserState.OFFLINE;
                     }
-                    UserInterface? user_interface = yield Bus.get_proxy (BusType.SYSTEM, LOGIN_IFACE, user.user_object, DBusProxyFlags.NONE);
-                    if (user_interface == null) {
-                        return UserState.OFFLINE;
-                    }
-                    return UserState.to_enum (user_interface.state);
+                    return UserState.to_enum (user_interface.get_session_state ());
                 }
             }
 
@@ -98,23 +103,7 @@ public class Session.Services.UserManager : Object {
     }
 
     public static async UserState get_guest_state () {
-        if (login_proxy == null) {
-            return UserState.OFFLINE;
-        }
-
-        try {
-            UserInfo[] users = login_proxy.list_users ();
-            foreach (UserInfo user in users) {
-                var state = yield get_user_state (user.uid);
-                if (user.user_name.has_prefix ("guest-")
-                    && state == UserState.ACTIVE) {
-                    return UserState.ACTIVE;
-                }
-            }
-        } catch (GLib.Error e) {
-            critical ("Failed to get Guest state: %s", e.message);
-        }
-
+        // Not yet supported
         return UserState.OFFLINE;
     }
 
