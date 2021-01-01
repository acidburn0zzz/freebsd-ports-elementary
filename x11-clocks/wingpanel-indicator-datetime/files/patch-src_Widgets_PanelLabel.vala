--- src/Widgets/PanelLabel.vala.orig	2020-03-29 19:40:47 UTC
+++ src/Widgets/PanelLabel.vala
@@ -34,7 +34,9 @@ public class DateTime.Widgets.PanelLabel : Gtk.Grid {
         date_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_LEFT;
         date_revealer.add (date_label);
 
-        time_label = new Gtk.Label (null);
+        time_label = new Gtk.Label (null) {
+            use_markup = true
+        };
 
         valign = Gtk.Align.CENTER;
         add (date_revealer);
@@ -66,6 +68,6 @@ public class DateTime.Widgets.PanelLabel : Gtk.Grid {
         date_label.label = time_manager.format (date_format);
 
         string time_format = Granite.DateTime.get_default_time_format (time_manager.is_12h, clock_show_seconds);
-        time_label.label = time_manager.format (time_format);
+        time_label.label = GLib.Markup.printf_escaped ("<span font_features='tnum'>%s</span>", time_manager.format (time_format));
     }
 }
