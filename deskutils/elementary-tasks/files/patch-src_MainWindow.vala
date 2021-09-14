--- src/MainWindow.vala.orig	2021-08-09 19:09:24 UTC
+++ src/MainWindow.vala
@@ -58,9 +58,10 @@ public class Tasks.MainWindow : Hdy.ApplicationWindow 
         add_action_entries (ACTION_ENTRIES, this);
 
         var application_instance = (Gtk.Application) GLib.Application.get_default ();
-        foreach (var action in action_accelerators.get_keys ()) {
+	var iter = action_accelerators.map_iterator ();
+	while (iter.next ()) {
             application_instance.set_accels_for_action (
-                ACTION_PREFIX + action, action_accelerators[action].to_array ()
+                ACTION_PREFIX + iter.get_key (), { iter.get_value () }
             );
         }
 
