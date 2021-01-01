--- src/Widgets/CategoryFlowBox.vala.orig	2020-04-30 20:47:16 UTC
+++ src/Widgets/CategoryFlowBox.vala
@@ -60,7 +60,7 @@ namespace Switchboard {
             attach (flowbox, 0, 1, 2, 1);
 
             flowbox.child_activated.connect ((child) => {
-                Switchboard.SwitchboardApp.instance.load_plug (((CategoryIcon) child).plug);
+                ((SwitchboardApp) GLib.Application.get_default ()).load_plug (((CategoryIcon) child).plug);
             });
 
             flowbox.set_sort_func (plug_sort_func);
