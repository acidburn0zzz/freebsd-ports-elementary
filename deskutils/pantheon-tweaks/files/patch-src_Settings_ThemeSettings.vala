--- src/Settings/ThemeSettings.vala.orig	2021-08-05 13:33:36 UTC
+++ src/Settings/ThemeSettings.vala
@@ -26,7 +26,7 @@ public class PantheonTweaks.ThemeSettings {
         var themes = new Gee.ArrayList<string> ();
 
         string[] dirs = {
-            "/usr/share/" + path + "/",
+            "%%LOCALBASE%%/share/" + path + "/",
             Environment.get_home_dir () + "/." + path + "/",
             Environment.get_home_dir () + "/.local/share/" + path + "/"};
 
