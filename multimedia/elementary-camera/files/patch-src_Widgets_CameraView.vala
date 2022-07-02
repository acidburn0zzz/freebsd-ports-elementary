--- src/Widgets/CameraView.vala.orig	2022-06-03 17:32:32 UTC
+++ src/Widgets/CameraView.vala
@@ -223,17 +223,9 @@ public class Camera.Widgets.CameraView : Gtk.Box {
             videorate.max_rate = 30;
             videorate.drop_only = true;
 
-            dynamic Gst.Element gtksink = Gst.ElementFactory.make ("gtkglsink", null);
-            if (gtksink != null) {
-                dynamic Gst.Element glsinkbin = Gst.ElementFactory.make ("glsinkbin", null);
-                glsinkbin.sink = gtksink;
-                pipeline.add (glsinkbin);
-                pipeline.get_by_name ("videoscale").link (glsinkbin);
-            } else {
-                gtksink = Gst.ElementFactory.make ("gtksink", null);
-                pipeline.add (gtksink);
-                pipeline.get_by_name ("videoscale").link (gtksink);
-            }
+            dynamic Gst.Element gtksink = Gst.ElementFactory.make ("gtksink", null);
+            pipeline.add (gtksink);
+            pipeline.get_by_name ("videoscale").link (gtksink);
 
             gst_video_widget = gtksink.widget;
 
@@ -274,11 +266,14 @@ public class Camera.Widgets.CameraView : Gtk.Box {
         color_balance.get_property ("contrast", ref contrast_value);
         Gst.Pipeline picture_pipeline;
         try {
+             // We directly use properties of v4l2src, instead videobalance filter
+             // See gst-inspect-1.0 v4l2src
              picture_pipeline = (Gst.Pipeline) Gst.parse_launch (
-                "v4l2src device=%s name=%s num-buffers=1 !".printf (device_path, VIDEO_SRC_NAME) +
+                "v4l2src device=%s name=%s num-buffers=1 ".printf (device_path, VIDEO_SRC_NAME) +
+                "brightness=%d contrast=%d !".printf ((int) GLib.Math.rint (brightness_value.get_double ()), (int) GLib.Math.rint (contrast_value.get_double ())) +
                 "videoscale ! video/x-raw, width=%d, height=%d !".printf (picture_width, picture_height) +
                 "videoflip method=%s !".printf ((horizontal_flip)?"horizontal-flip":"none") +
-                "videobalance brightness=%f contrast=%f !".printf (brightness_value.get_double (), contrast_value.get_double ()) +
+                "videobalance !" +
                 "jpegenc ! filesink location=%s name=filesink".printf (Camera.Utils.get_new_media_filename (Camera.Utils.ActionType.PHOTO))
             );
 
@@ -336,9 +331,9 @@ public class Camera.Widgets.CameraView : Gtk.Box {
             missing_messages += Gst.PbUtils.missing_element_installer_detail_new ("webmmux");
         }
 
-        var alsasrc = Gst.ElementFactory.make ("alsasrc", null);
-        if (alsasrc == null) {
-            missing_messages += Gst.PbUtils.missing_element_installer_detail_new ("alsasrc");
+        var sound_src = Gst.ElementFactory.make ("osssrc", null);
+        if (sound_src == null) {
+            missing_messages += Gst.PbUtils.missing_element_installer_detail_new ("osssrc");
         }
 
         var audio_queue = Gst.ElementFactory.make ("queue", null);
@@ -361,7 +356,8 @@ public class Camera.Widgets.CameraView : Gtk.Box {
         }
 
         if (missing_messages.length > 0) {
-            Gst.PbUtils.install_plugins_async (missing_messages, null, (result) => {});
+            // There is no wrapper around pkg(8) for missing plugins
+            //Gst.PbUtils.install_plugins_async (missing_messages, null, (result) => {}); 
             recording = false;
             return;
         }
@@ -369,8 +365,8 @@ public class Camera.Widgets.CameraView : Gtk.Box {
         record_bin.add_many (queue, videoconvert, encoder, muxer, filesink);
         queue.link_many (videoconvert, encoder, muxer, filesink);
 
-        record_bin.add_many (alsasrc, audio_queue, audio_convert, audio_vorbis);
-        alsasrc.link_many (audio_queue, audio_convert, audio_vorbis, muxer);
+        record_bin.add_many (sound_src, audio_queue, audio_convert, audio_vorbis);
+        sound_src.link_many (audio_queue, audio_convert, audio_vorbis, muxer);
 
         var ghostpad = new Gst.GhostPad (null, queue.get_static_pad ("sink"));
         record_bin.add_pad (ghostpad);
