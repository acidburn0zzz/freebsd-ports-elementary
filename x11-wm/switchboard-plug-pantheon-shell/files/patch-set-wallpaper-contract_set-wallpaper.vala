--- set-wallpaper-contract/set-wallpaper.vala.orig	2022-08-15 18:15:27 UTC
+++ set-wallpaper-contract/set-wallpaper.vala
@@ -163,7 +163,7 @@ namespace SetWallpaperContractor {
             dest = File.new_for_path (Path.build_filename (greeter_data_dir, source.get_basename ()));
             source.copy (dest, FileCopyFlags.OVERWRITE | FileCopyFlags.ALL_METADATA);
             // Ensure wallpaper is readable by greeter user (owner rw, others r)
-            FileUtils.chmod (dest.get_path (), 0604);
+            FileUtils.chmod (dest.get_path (), 0644);
         } catch (Error e) {
             warning ("%s\n", e.message);
             return null;
