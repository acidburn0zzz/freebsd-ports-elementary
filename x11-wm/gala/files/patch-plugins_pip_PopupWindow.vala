--- plugins/pip/PopupWindow.vala.orig	2020-04-30 22:23:37 UTC
+++ plugins/pip/PopupWindow.vala
@@ -67,7 +67,7 @@ public class Gala.Plugins.PIP.PopupWindow : Clutter.Ac
     }
 
     static void get_current_cursor_position (out int x, out int y) {
-        Gdk.Display.get_default ().get_device_manager ().get_client_pointer ().get_position (null, out x, out y);
+        Gdk.Display.get_default ().get_default_seat ().get_pointer ().get_position (null, out x, out y);
     }
 
     public PopupWindow (Gala.WindowManager wm, Meta.WindowActor window_actor) {
