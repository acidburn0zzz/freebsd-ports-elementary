--- src/Tools/Recorder.vala.orig	2021-12-08 23:42:01 UTC
+++ src/Tools/Recorder.vala
@@ -80,6 +80,17 @@ namespace ScreenRec {
             pam.start ();
         }
 
+        private string? get_human_ncpu (string cores){
+            string[] tokens;
+            string result = null;
+
+            tokens = cores.split (": ");
+            if (tokens.length == 2) {
+                result = tokens[1];
+            }
+            return result;
+        }
+
         public void config (ScreenrecorderWindow.CaptureType capture_mode,
                             string tmp_file,
                             int frame_rate,
@@ -98,13 +109,13 @@ namespace ScreenRec {
             this.format = format;
             this.window = window;
 
-            string cores = "0-1";
+            string cores = "hw.ncpu: 1";
             try {
-                Process.spawn_command_line_sync ("cat /sys/devices/system/cpu/online", out cores);
-            } catch (Error e) {
+                Process.spawn_command_line_sync ("sysctl hw.ncpu", out cores);
+            } catch (GLib.SpawnError e) {
                 warning (e.message);
             }
-            this.cpu_cores = int.parse (cores.substring (2));
+            this.cpu_cores = int.parse (get_human_ncpu (cores));
 
             pipeline = new Gst.Pipeline ("screencast-pipe");
 
@@ -235,7 +246,7 @@ namespace ScreenRec {
 
                 string audio_source = get_default_audio_output();
 
-                audiosrc = Gst.ElementFactory.make("pulsesrc", "audio_src");
+                audiosrc = Gst.ElementFactory.make("autoaudiosrc", "audio_src");
                 audiosrc.set_property("device", audio_source);
                 Gst.Caps aud_caps = Gst.Caps.from_string("audio/x-raw");
                 aud_caps_filter = Gst.ElementFactory.make("capsfilter", "aud_filter");
@@ -247,7 +258,7 @@ namespace ScreenRec {
 
                 string audio2_source = get_default_audio_input();
 
-                audio2src = Gst.ElementFactory.make("pulsesrc", "audio2_src");
+                audio2src = Gst.ElementFactory.make("autoaudiosrc", "audio2_src");
                 audio2src.set_property("device", audio2_source);
                 Gst.Caps aud2_caps = Gst.Caps.from_string("audio/x-raw");
                 aud2_caps_filter = Gst.ElementFactory.make("capsfilter", "aud2_filter");
@@ -504,4 +515,4 @@ namespace ScreenRec {
             this.is_recording_in_progress = false;
         }
     }
-}
\ No newline at end of file
+}
