--- src/Indicator.vala.orig	2020-03-29 19:40:47 UTC
+++ src/Indicator.vala
@@ -28,9 +28,7 @@ public class DateTime.Indicator : Wingpanel.Indicator 
 
     public Indicator () {
         Object (
-            code_name: Wingpanel.Indicator.DATETIME,
-            display_name: _("Date & Time"),
-            description: _("The date and time indicator")
+            code_name: Wingpanel.Indicator.DATETIME
         );
     }
 
@@ -84,10 +82,9 @@ public class DateTime.Indicator : Wingpanel.Indicator 
             main_grid = new Gtk.Grid ();
             main_grid.margin_top = 12;
             main_grid.attach (calendar, 0, 0);
-            main_grid.attach (new Gtk.Separator (Gtk.Orientation.VERTICAL), 1, 0);
-            main_grid.attach (scrolled_window, 2, 0);
-            main_grid.attach (new Wingpanel.Widgets.Separator (), 0, 2, 3);
-            main_grid.attach (settings_button, 0, 3, 3);
+            main_grid.attach (scrolled_window, 1, 0);
+            main_grid.attach (new Wingpanel.Widgets.Separator (), 0, 2, 2);
+            main_grid.attach (settings_button, 0, 3, 2);
 
             var size_group = new Gtk.SizeGroup (Gtk.SizeGroupMode.HORIZONTAL);
             size_group.add_widget (calendar);
@@ -226,8 +223,14 @@ public class DateTime.Indicator : Wingpanel.Indicator 
     }
 }
 
-public Wingpanel.Indicator get_indicator (Module module) {
+public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
     debug ("Activating DateTime Indicator");
+
+    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
+        debug ("Wingpanel is not in session, not loading DateTime");
+        return null;
+    }
+
     var indicator = new DateTime.Indicator ();
 
     return indicator;
