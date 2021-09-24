--- lib/IndicatorManager.vala.orig	2021-07-13 23:36:01 UTC
+++ lib/IndicatorManager.vala
@@ -62,7 +62,7 @@ public class Wingpanel.IndicatorManager : GLib.Object 
     public signal void indicator_removed (Wingpanel.Indicator indicator);
 
     /**
-     * Place the files in /etc/wingpanel.d/ or ~/.config/wingpanel.d/
+     * Place the files in %%PREFIX%%/etc/wingpanel.d/ or ~/.config/wingpanel.d/
      * default.forbidden, greeter.allowed or combinations of it.
      */
     private Gee.HashSet<string> forbidden_indicators;
@@ -95,7 +95,7 @@ public class Wingpanel.IndicatorManager : GLib.Object 
         this.server_type = server_type;
 
         /* load inclusion/exclusion lists */
-        var root_restrictions_folder = File.new_for_path ("/etc/wingpanel.d/");
+        var root_restrictions_folder = File.new_for_path ("%%PREFIX%%/etc/wingpanel.d/");
         var user_restrictions_folder = File.new_for_path (Path.build_filename (Environment.get_user_config_dir (), "wingpanel.d"));
 
         try {
