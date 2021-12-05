--- src/Widgets/CameraView.vala.orig	2021-11-23 21:04:30 UTC
+++ src/Widgets/CameraView.vala
@@ -254,7 +254,7 @@ public class Camera.Widgets.CameraView : Gtk.Stack {
         try {
              picture_pipeline = (Gst.Pipeline) Gst.parse_launch (
                 "v4l2src device=%s name=%s num-buffers=1 !".printf (device_path, VIDEO_SRC_NAME) +
-                "image/jpeg, width=%d, height=%d ! jpegdec ! ".printf (picture_width, picture_height) +
+                "videoscale ! video/x-raw,width=%d,height=%d !".printf (picture_width, picture_height) +
                 "videoflip method=%s !".printf ((horizontal_flip)?"horizontal-flip":"none") +
                 "videobalance brightness=%f contrast=%f !".printf (brightness_value.get_double (), contrast_value.get_double ()) +
                 "jpegenc ! filesink location=%s name=filesink".printf (Camera.Utils.get_new_media_filename (Camera.Utils.ActionType.PHOTO))
@@ -314,9 +314,9 @@ public class Camera.Widgets.CameraView : Gtk.Stack {
             missing_messages += Gst.PbUtils.missing_element_installer_detail_new ("webmmux");
         }
 
-        var alsasrc = Gst.ElementFactory.make ("alsasrc", null);
-        if (alsasrc == null) {
-            missing_messages += Gst.PbUtils.missing_element_installer_detail_new ("alsasrc");
+        var sound = Gst.ElementFactory.make ("osssrc", null);
+        if (sound == null) {
+            missing_messages += Gst.PbUtils.missing_element_installer_detail_new ("osssrc");
         }
 
         var audio_queue = Gst.ElementFactory.make ("queue", null);
@@ -347,8 +347,8 @@ public class Camera.Widgets.CameraView : Gtk.Stack {
         record_bin.add_many (queue, videoconvert, encoder, muxer, filesink);
         queue.link_many (videoconvert, encoder, muxer, filesink);
 
-        record_bin.add_many (alsasrc, audio_queue, audio_convert, audio_vorbis);
-        alsasrc.link_many (audio_queue, audio_convert, audio_vorbis, muxer);
+        record_bin.add_many (sound, audio_queue, audio_convert, audio_vorbis);
+        sound.link_many (audio_queue, audio_convert, audio_vorbis, muxer);
 
         var ghostpad = new Gst.GhostPad (null, queue.get_static_pad ("sink"));
         record_bin.add_pad (ghostpad);
