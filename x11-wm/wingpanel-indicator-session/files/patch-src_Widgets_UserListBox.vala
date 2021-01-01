--- src/Widgets/UserListBox.vala.orig	2020-04-01 23:50:50 UTC
+++ src/Widgets/UserListBox.vala
@@ -19,48 +19,28 @@
 
  public class Session.Widgets.UserListBox : Gtk.ListBox {
     public signal void close ();
+    public signal void switch_to_guest ();
+    public signal void switch_to_user (string username);
 
-    private SeatInterface? seat = null;
-    private string session_path;
-
-    private const string DM_DBUS_ID = "org.freedesktop.DisplayManager";
-
     public UserListBox () {
-        session_path = Environment.get_variable ("XDG_SESSION_PATH");
-
-        var seat_path = Environment.get_variable ("XDG_SEAT_PATH");
-        if (seat_path != null) {
-            try {
-                seat = Bus.get_proxy_sync (BusType.SYSTEM, DM_DBUS_ID, seat_path, DBusProxyFlags.NONE);
-            } catch (IOError e) {
-                critical ("DisplayManager.Seat error: %s", e.message);
-            }
-        }
-
         this.set_sort_func (sort_func);
         this.set_activate_on_single_click (true);
     }
 
     public override void row_activated (Gtk.ListBoxRow row) {
         var userbox = (Userbox)row;
-        if (userbox == null
-            || seat == null
-            || session_path == "") {
+        if (userbox == null) {
             return;
         }
 
         close ();
-        try {
-            if (userbox.is_guest) {
-                seat.switch_to_guest ("");
-            } else {
-                var user = userbox.user;
-                if (user != null) {
-                    seat.switch_to_user (user.get_user_name (), session_path);
-                }
+        if (userbox.is_guest) {
+            switch_to_guest ();
+        } else {
+            var user = userbox.user;
+            if (user != null) {
+                switch_to_user (user.get_user_name ());
             }
-        } catch (GLib.Error e) {
-            warning ("DisplayManager.Seat error: %s", e.message);
         }
     }
 
