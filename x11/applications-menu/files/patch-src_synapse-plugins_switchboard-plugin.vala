--- src/synapse-plugins/switchboard-plugin.vala.orig	2020-04-29 21:58:06 UTC
+++ src/synapse-plugins/switchboard-plugin.vala
@@ -55,7 +55,7 @@ public class Synapse.SwitchboardObject: Synapse.Match 
 
     public override void execute (Match? match) {
         try {
-            Gtk.show_uri (null, "settings://%s".printf (uri), Gdk.CURRENT_TIME);
+            AppInfo.launch_default_for_uri ("settings://%s".printf (uri), null);
         } catch (Error e) {
             warning ("Failed to show URI for %s: %s\n".printf (uri, e.message));
         }
