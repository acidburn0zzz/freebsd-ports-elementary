--- vapi/mutter-clutter.vapi.orig	2021-09-22 20:42:08 UTC
+++ vapi/mutter-clutter.vapi
@@ -7336,7 +7336,7 @@ namespace Clutter {
 		[Version (since = "1.2")]
 		public bool get_use_alpha ();
 #if HAS_MUTTER338
-		public bool paint_to_buffer (Cairo.RectangleInt rect, float scale, [CCode (array_length = false)] ref unowned uint8[] data, int stride, Cogl.PixelFormat format, Clutter.PaintFlag paint_flags) throws GLib.Error;
+		public bool paint_to_buffer (Cairo.RectangleInt rect, float scale, [CCode (array_length = false, type = "uint8_t*")] uint8[] data, int stride, Cogl.PixelFormat format, Clutter.PaintFlag paint_flags) throws GLib.Error;
 		public void paint_to_framebuffer (Cogl.Framebuffer framebuffer, Cairo.RectangleInt rect, float scale, Clutter.PaintFlag paint_flags);
 #else
 		[Version (since = "0.4")]
