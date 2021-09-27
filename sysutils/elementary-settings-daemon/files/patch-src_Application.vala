--- src/Application.vala.orig	2021-07-15 23:29:21 UTC
+++ src/Application.vala
@@ -38,14 +38,10 @@ public class SettingsDaemon.Application : GLib.Applica
 
     private Backends.PrefersColorSchemeSettings prefers_color_scheme_settings;
 
-    private Backends.Housekeeping housekeeping;
-
     construct {
         application_id = Build.PROJECT_NAME;
 
         add_main_option_entries (OPTIONS);
-
-        housekeeping = new Backends.Housekeeping ();
     }
 
     public override int handle_local_options (VariantDict options) {
