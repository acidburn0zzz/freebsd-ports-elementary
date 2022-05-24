--- src/MainWindow.vala.orig	2022-05-23 23:42:49 UTC
+++ src/MainWindow.vala
@@ -106,10 +106,11 @@ public class Mail.MainWindow : Hdy.ApplicationWindow {
         add_action_entries (ACTION_ENTRIES, this);
         get_action (ACTION_COMPOSE_MESSAGE).set_enabled (false);
 
-        foreach (var action in action_accelerators.get_keys ()) {
+        var iter = action_accelerators.map_iterator ();
+        while (iter.next ()) {
             ((Gtk.Application) GLib.Application.get_default ()).set_accels_for_action (
-                ACTION_PREFIX + action,
-                action_accelerators[action].to_array ()
+                ACTION_PREFIX + iter.get_key (),
+                { iter.get_value () }
             );
         }
 
