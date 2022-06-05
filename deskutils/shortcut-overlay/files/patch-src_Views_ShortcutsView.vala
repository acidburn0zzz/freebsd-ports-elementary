--- src/Views/ShortcutsView.vala.orig	2022-05-12 16:35:54 UTC
+++ src/Views/ShortcutsView.vala
@@ -122,7 +122,7 @@ public class ShortcutOverlay.ShortcutsView : Gtk.Box {
 
         column_end.attach (system_header, 0, 0, 2);
         column_end.attach (new NameLabel (_("Applications Menu:")), 0, 1);
-        column_end.attach (new ShortcutLabel.from_gsettings (SCHEMA_GALA, "panel-main-menu"), 1, 1);
+        column_end.attach (new ShortcutLabel.from_gsettings (SCHEMA_WM, "panel-main-menu"), 1, 1);
         column_end.attach (new NameLabel (_("Cycle display mode:")), 0, 2);
         column_end.attach (new ShortcutLabel.from_gsettings (SCHEMA_MUTTER, "switch-monitor"), 1, 2);
         column_end.attach (new NameLabel (_("Zoom in:")), 0, 3);
