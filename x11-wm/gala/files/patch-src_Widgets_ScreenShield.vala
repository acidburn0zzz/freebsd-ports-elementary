--- src/Widgets/ScreenShield.vala.orig	2022-04-07 06:54:49 UTC
+++ src/Widgets/ScreenShield.vala
@@ -16,16 +16,16 @@
 //
 
 namespace Gala {
-    [DBus (name = "org.freedesktop.login1.Manager")]
+    [DBus (name = "org.freedesktop.ConsoleKit.Manager")]
     interface LoginManager : Object {
         public signal void prepare_for_sleep (bool about_to_suspend);
 
-        public abstract GLib.ObjectPath get_session (string session_id) throws GLib.Error;
+        public abstract GLib.ObjectPath get_current_session () throws GLib.Error;
 
         public abstract UnixInputStream inhibit (string what, string who, string why, string mode) throws GLib.Error;
     }
 
-    [DBus (name = "org.freedesktop.login1.Session")]
+    [DBus (name = "org.freedesktop.ConsoleKit.Session")]
     interface LoginSessionManager : Object {
         public abstract bool active { get; }
 
@@ -35,16 +35,6 @@ namespace Gala {
         public abstract void set_locked_hint (bool locked) throws GLib.Error;
     }
 
-    public struct LoginDisplay {
-        string session;
-        GLib.ObjectPath objectpath;
-    }
-
-    [DBus (name = "org.freedesktop.login1.User")]
-    interface LoginUserManager : Object {
-        public abstract LoginDisplay? display { owned get; }
-    }
-
     [CCode (type_signature = "u")]
     enum PresenceStatus {
         AVAILABLE = 0,
@@ -90,7 +80,6 @@ namespace Gala {
         private ModalProxy? modal_proxy;
 
         private LoginManager? login_manager;
-        private LoginUserManager? login_user_manager;
         private LoginSessionManager? login_session;
         private SessionPresence? session_presence;
 
@@ -143,8 +132,7 @@ namespace Gala {
             bool success = true;
 
             try {
-                login_manager = yield Bus.get_proxy (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1");
-                login_user_manager = yield Bus.get_proxy (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1/user/self");
+                login_manager = yield Bus.get_proxy (BusType.SYSTEM, "org.freedesktop.ConsoleKit", "/org/freedesktop/ConsoleKit/Manager");
 
                 // Listen for sleep/resume events from logind
                 login_manager.prepare_for_sleep.connect (prepare_for_sleep);
@@ -285,22 +273,10 @@ namespace Gala {
         }
 
         private LoginSessionManager? get_current_session_manager () throws GLib.Error {
-            string? session_id = GLib.Environment.get_variable ("XDG_SESSION_ID");
-            if (session_id == null) {
-                debug ("Unset XDG_SESSION_ID, asking logind");
-                if (login_user_manager == null) {
-                    return null;
-                }
+            GLib.ObjectPath session_path;
 
-                session_id = login_user_manager.display.session;
-            }
-
-            if (session_id == null) {
-                return null;
-            }
-
-            var session_path = login_manager.get_session (session_id);
-            LoginSessionManager? session = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.login1", session_path);
+            session_path = login_manager.get_current_session ();
+            LoginSessionManager? session = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.ConsoleKit", session_path);
 
             return session;
         }
