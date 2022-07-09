--- src/Services/DbusInterfaces.vala.orig	2021-07-13 23:28:32 UTC
+++ src/Services/DbusInterfaces.vala
@@ -17,12 +17,6 @@
  * Boston, MA 02110-1301 USA
  */
 
-struct UserInfo {
-    uint32 uid;
-    string user_name;
-    ObjectPath? user_object;
-}
-
 [DBus (name = "org.gnome.SessionManager")]
 interface SessionInterface : Object {
     public abstract async void logout (uint type) throws GLib.Error;
@@ -36,18 +30,21 @@ interface LockInterface : Object {
     public abstract void lock () throws GLib.Error;
 }
 
-[DBus (name = "org.freedesktop.login1.Manager")]
+[DBus (name = "org.freedesktop.ConsoleKit.Manager")]
 interface SystemInterface : Object {
-    public abstract void suspend (bool interactive) throws GLib.Error;
-    public abstract void reboot (bool interactive) throws GLib.Error;
-    public abstract void power_off (bool interactive) throws GLib.Error;
+    public abstract async void suspend (bool interactive) throws GLib.Error;
+    public abstract async void reboot (bool interactive) throws GLib.Error;
+    public abstract async void power_off (bool interactive) throws GLib.Error;
 
-    public abstract UserInfo[] list_users () throws GLib.Error;
+    public abstract GLib.ObjectPath[] get_sessions () throws GLib.Error;
 }
 
-[DBus (name = "org.freedesktop.login1.User")]
+[DBus (name = "org.freedesktop.ConsoleKit.Session")]
 interface UserInterface : Object {
-    public abstract string state { owned get; }
+    // We use methods (instead of properties)
+    public abstract uint32 get_unix_user () throws GLib.Error;
+    public abstract string get_session_class () throws GLib.Error;
+    public abstract string get_session_state () throws GLib.Error;
 }
 
 [DBus (name = "org.freedesktop.DisplayManager.Seat")]
