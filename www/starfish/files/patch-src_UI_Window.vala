--- src/UI/Window.vala.orig	2021-12-18 22:12:29 UTC
+++ src/UI/Window.vala
@@ -104,10 +104,11 @@ public class Starfish.UI.Window : Hdy.ApplicationWindo
     private void setup_actions () {
         var app = (Application) GLib.Application.get_default ();
         add_action_entries (ACTION_ENTRIES, this);
-        foreach (var action in action_accelerators.get_keys ()) {
+        var iter = action_accelerators.map_iterator ();
+        while (iter.next ()) {
             app.set_accels_for_action (
-                ACTION_PREFIX + action,
-                action_accelerators[action].to_array ()
+                ACTION_PREFIX + iter.get_key (),
+                { iter.get_value () }
             );
         }
 
