--- src/SearchView.vala.orig	2020-04-30 20:47:16 UTC
+++ src/SearchView.vala
@@ -30,6 +30,10 @@ public class Switchboard.SearchView : Gtk.ScrolledWind
         alert_view.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);
         alert_view.show_all ();
 
+        unowned SwitchboardApp app = (SwitchboardApp) GLib.Application.get_default ();
+
+        search_entry = app.search_box;
+
         listbox = new Gtk.ListBox ();
         listbox.selection_mode = Gtk.SelectionMode.BROWSE;
         listbox.set_filter_func (filter_func);
@@ -39,7 +43,6 @@ public class Switchboard.SearchView : Gtk.ScrolledWind
 
         load_plugs.begin ();
 
-        search_entry = SwitchboardApp.instance.search_box;
         search_entry.search_changed.connect (() => {
             alert_view.title = _("No Results for “%s”").printf (search_entry.text);
             listbox.invalidate_filter ();
@@ -47,7 +50,7 @@ public class Switchboard.SearchView : Gtk.ScrolledWind
         });
 
         listbox.row_activated.connect ((row) => {
-            SwitchboardApp.instance.load_setting_path (
+            app.load_setting_path (
                 ((SearchRow) row).uri.replace ("settings://", ""),
                 Switchboard.PlugsManager.get_default ()
             );
