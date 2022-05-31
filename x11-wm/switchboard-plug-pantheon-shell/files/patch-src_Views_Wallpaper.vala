--- src/Views/Wallpaper.vala.orig	2021-11-23 21:26:47 UTC
+++ src/Views/Wallpaper.vala
@@ -223,11 +223,6 @@ public class PantheonShell.Wallpaper : Gtk.Grid {
             }
         }
 
-        var greeter_file = copy_for_greeter (file);
-        if (greeter_file != null) {
-            path = greeter_file.get_path ();
-        }
-
         settings.set_string ("picture-uri", uri);
         accountsservice.background_file = path;
     }
@@ -453,37 +448,6 @@ public class PantheonShell.Wallpaper : Gtk.Grid {
             source.copy (dest, FileCopyFlags.OVERWRITE | FileCopyFlags.ALL_METADATA);
         } catch (Error e) {
             warning (e.message);
-        }
-
-        return dest;
-    }
-
-    private static File? copy_for_greeter (File source) {
-        File? dest = null;
-        try {
-            string greeter_data_dir = Path.build_filename (Environment.get_variable ("XDG_GREETER_DATA_DIR"), "wallpaper");
-            if (greeter_data_dir == "") {
-                greeter_data_dir = Path.build_filename ("/var/lib/lightdm-data/", Environment.get_user_name (), "wallpaper");
-            }
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
-            warning (e.message);
-            return null;
         }
 
         return dest;
