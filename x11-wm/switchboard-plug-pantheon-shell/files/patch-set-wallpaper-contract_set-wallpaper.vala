--- set-wallpaper-contract/set-wallpaper.vala.orig	2021-11-23 21:26:47 UTC
+++ set-wallpaper-contract/set-wallpaper.vala
@@ -138,34 +138,6 @@ namespace SetWallpaperContractor {
         return dest;
     }
 
-    private File? copy_for_greeter (File source) {
-        File? dest = null;
-        try {
-            string greeter_data_dir = Path.build_filename (Environment.get_variable ("XDG_GREETER_DATA_DIR"), "wallpaper");
-
-            var folder = File.new_for_path (greeter_data_dir);
-            if (folder.query_exists ()) {
-                var enumerator = folder.enumerate_children ("standard::*", FileQueryInfoFlags.NOFOLLOW_SYMLINKS);
-                FileInfo? info = null;
-                while ((info = enumerator.next_file ()) != null) {
-                    enumerator.get_child (info).@delete ();
-                }
-            } else {
-                folder.make_directory_with_parents ();
-            }
-
-            dest = File.new_for_path (Path.build_filename (greeter_data_dir, source.get_basename ()));
-            source.copy (dest, FileCopyFlags.OVERWRITE | FileCopyFlags.ALL_METADATA);
-            // Ensure wallpaper is readable by greeter user (owner rw, others r)
-            FileUtils.chmod (dest.get_path (), 0604);
-        } catch (Error e) {
-            warning ("%s\n", e.message);
-            return null;
-        }
-
-        return dest;
-    }
-
     public static int main (string[] args) {
         Gtk.init (ref args);
 
@@ -196,11 +168,6 @@ namespace SetWallpaperContractor {
                 }
 
                 files.append (append_file);
-
-                var greeter_file = copy_for_greeter (file);
-                if (greeter_file != null) {
-                    path = greeter_file.get_path ();
-                }
 
                 accounts_service.background_file = path;
             }
