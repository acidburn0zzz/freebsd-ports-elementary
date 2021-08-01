--- src/Application.vala.orig	2021-07-21 20:19:02 UTC
+++ src/Application.vala
@@ -67,6 +67,9 @@ public class Camera.Application : Gtk.Application {
 
     public static int main (string[] args) {
         Gst.init (ref args);
+        // Since GStreamer 1.14, the use of libv4l2 has been disabled
+        // due to major bugs in the emulation layer.
+        GLib.Environment.set_variable ("GST_V4L2_USE_LIBV4L2", "1", true);
 
         var application = new Application ();
 
