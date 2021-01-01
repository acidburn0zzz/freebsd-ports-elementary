--- src/WindowManager.vala.orig	2020-04-30 22:23:37 UTC
+++ src/WindowManager.vala
@@ -825,7 +825,7 @@ namespace Gala {
         }
 
         public void get_current_cursor_position (out int x, out int y) {
-            Gdk.Display.get_default ().get_device_manager ().get_client_pointer ().get_position (null,
+            Gdk.Display.get_default ().get_default_seat ().get_pointer ().get_position (null,
                 out x, out y);
         }
 
