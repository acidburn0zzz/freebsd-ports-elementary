--- src/Application.vala.orig	2021-12-24 01:52:18 UTC
+++ src/Application.vala
@@ -26,7 +26,7 @@ public class AppEditor.Application : Gtk.Application {
         return Gtk.check_version (3, 22, 0) == null;
     }
 
-    private static string? create_exec_filename;
+    public static string? create_exec_filename;
 
     private MainWindow? window = null;
 
