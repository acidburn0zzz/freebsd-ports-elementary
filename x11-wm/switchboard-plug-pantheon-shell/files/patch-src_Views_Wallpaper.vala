--- src/Views/Wallpaper.vala.orig	2022-08-15 18:15:27 UTC
+++ src/Views/Wallpaper.vala
@@ -497,7 +497,7 @@ public class PantheonShell.Wallpaper : Gtk.Grid {
             dest = File.new_for_path (Path.build_filename (greeter_data_dir, source.get_basename ()));
             source.copy (dest, FileCopyFlags.OVERWRITE | FileCopyFlags.ALL_METADATA);
             // Ensure wallpaper is readable by greeter user (owner rw, others r)
-            FileUtils.chmod (dest.get_path (), 0604);
+            FileUtils.chmod (dest.get_path (), 0644);
         } catch (Error e) {
             warning (e.message);
             return null;
