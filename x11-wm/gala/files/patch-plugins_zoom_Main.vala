--- plugins/zoom/Main.vala.orig	2020-04-30 22:23:37 UTC
+++ plugins/zoom/Main.vala
@@ -91,7 +91,7 @@ namespace Gala.Plugins.Zoom {
             // to show requested zoomed area
             if (mouse_poll_timer == 0) {
                 float mx, my;
-                var client_pointer = Gdk.Display.get_default ().get_device_manager ().get_client_pointer ();
+                var client_pointer = Gdk.Display.get_default ().get_default_seat ().get_pointer ();
                 client_pointer.get_position (null, out mx, out my);
                 wins.set_pivot_point (mx / wins.width, my / wins.height);
 
