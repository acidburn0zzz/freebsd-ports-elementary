--- src/Widgets/CameraView.vala.orig	2021-07-21 20:19:02 UTC
+++ src/Widgets/CameraView.vala
@@ -352,9 +352,9 @@ public class Camera.Widgets.CameraView : Gtk.Stack {
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
@@ -385,8 +385,8 @@ public class Camera.Widgets.CameraView : Gtk.Stack {
         record_bin.add_many (queue, videoconvert, encoder, muxer, filesink);
         queue.link_many (videoconvert, encoder, muxer, filesink);
 
-        record_bin.add_many (alsasrc, audio_queue, audio_convert, audio_vorbis);
-        alsasrc.link_many (audio_queue, audio_convert, audio_vorbis, muxer);
+        record_bin.add_many (sound, audio_queue, audio_convert, audio_vorbis);
+        sound.link_many (audio_queue, audio_convert, audio_vorbis, muxer);
 
         var ghostpad = new Gst.GhostPad (null, queue.get_static_pad ("sink"));
         record_bin.add_pad (ghostpad);
