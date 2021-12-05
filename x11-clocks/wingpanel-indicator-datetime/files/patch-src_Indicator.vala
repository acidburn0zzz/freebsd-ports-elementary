--- src/Indicator.vala.orig	2021-10-29 23:15:33 UTC
+++ src/Indicator.vala
@@ -79,20 +79,10 @@ public class DateTime.Indicator : Wingpanel.Indicator 
             scrolled_window.hscrollbar_policy = Gtk.PolicyType.NEVER;
             scrolled_window.add (event_listbox);
 
-            var settings_button = new Gtk.ModelButton ();
-            settings_button.text = _("Date & Time Settings…");
-
-            var sep = new Gtk.Separator (Gtk.Orientation.HORIZONTAL) {
-                margin_bottom = 3,
-                margin_top = 3
-            };
-
             main_grid = new Gtk.Grid ();
             main_grid.margin_top = 12;
             main_grid.attach (calendar, 0, 0);
             main_grid.attach (scrolled_window, 1, 0);
-            main_grid.attach (sep, 0, 2, 2);
-            main_grid.attach (settings_button, 0, 3, 2);
 
             var size_group = new Gtk.SizeGroup (Gtk.SizeGroupMode.HORIZONTAL);
             size_group.add_widget (calendar);
@@ -109,14 +99,6 @@ public class DateTime.Indicator : Wingpanel.Indicator 
             event_listbox.row_activated.connect ((row) => {
                 calendar.show_date_in_maya (((DateTime.EventRow) row).date);
                 close ();
-            });
-
-            settings_button.clicked.connect (() => {
-                try {
-                    AppInfo.launch_default_for_uri ("settings://time", null);
-                } catch (Error e) {
-                    warning ("Could not open time and date settings: %s", e.message);
-                }
             });
         }
 
