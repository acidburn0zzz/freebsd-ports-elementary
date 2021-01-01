--- src/Widgets/WindowSwitcher.vala.orig	2020-04-30 22:23:37 UTC
+++ src/Widgets/WindowSwitcher.vala
@@ -778,7 +778,7 @@ namespace Gala {
         Gdk.ModifierType get_current_modifiers () {
             Gdk.ModifierType modifiers;
             double[] axes = {};
-            Gdk.Display.get_default ().get_device_manager ().get_client_pointer ()
+            Gdk.Display.get_default ().get_default_seat ().get_pointer ()
                 .get_state (Gdk.get_default_root_window (), axes, out modifiers);
 
             return modifiers;
