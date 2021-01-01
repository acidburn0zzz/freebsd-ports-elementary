--- src/CategoryView.vala.orig	2020-04-30 20:47:16 UTC
+++ src/CategoryView.vala
@@ -107,7 +107,7 @@ namespace Switchboard {
                     return;
             }
 
-            unowned SwitchboardApp app = SwitchboardApp.instance;
+            unowned SwitchboardApp app = (SwitchboardApp) GLib.Application.get_default ();
             app.search_box.sensitive = true;
 
             var any_found = false;
