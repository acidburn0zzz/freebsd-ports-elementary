--- src/ScreenshotManager.vala.orig	2021-09-22 20:42:08 UTC
+++ src/ScreenshotManager.vala
@@ -354,12 +354,11 @@ namespace Gala {
                 paint_flags |= Clutter.PaintFlag.FORCE_CURSORS;
             }
 
-            unowned var data = image.get_data ();
             if (GLib.ByteOrder.HOST == GLib.ByteOrder.LITTLE_ENDIAN) {
                 wm.stage.paint_to_buffer (
                     {x, y, width, height},
                     scale,
-                    ref data,
+                    image.get_data (),
                     image.get_stride (),
                     Cogl.PixelFormat.BGRA_8888_PRE,
                     paint_flags
@@ -368,7 +367,7 @@ namespace Gala {
                 wm.stage.paint_to_buffer (
                     {x, y, width, height},
                     scale,
-                    ref data,
+                    image.get_data (),
                     image.get_stride (),
                     Cogl.PixelFormat.ARGB_8888_PRE,
                     paint_flags
