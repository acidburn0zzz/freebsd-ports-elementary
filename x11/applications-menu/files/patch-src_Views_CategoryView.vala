--- src/Views/CategoryView.vala.orig	2020-04-29 21:58:06 UTC
+++ src/Views/CategoryView.vala
@@ -41,11 +41,8 @@ public class Slingshot.Widgets.CategoryView : Gtk.Even
         category_switcher.set_sort_func ((Gtk.ListBoxSortFunc) category_sort_func);
         category_switcher.width_request = 120;
 
-        unowned Gtk.StyleContext category_switcher_style_context = category_switcher.get_style_context ();
-        category_switcher_style_context.add_class (Gtk.STYLE_CLASS_SIDEBAR);
-        category_switcher_style_context.add_class (Gtk.STYLE_CLASS_VIEW);
-
         var scrolled_category = new Gtk.ScrolledWindow (null, null);
+        scrolled_category.get_style_context ().add_class (Gtk.STYLE_CLASS_SIDEBAR);
         scrolled_category.set_policy (Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC);
         scrolled_category.add (category_switcher);
 
@@ -54,6 +51,7 @@ public class Slingshot.Widgets.CategoryView : Gtk.Even
         listbox = new NavListBox ();
         listbox.expand = true;
         listbox.selection_mode = Gtk.SelectionMode.BROWSE;
+        listbox.set_filter_func ((Gtk.ListBoxFilterFunc) filter_function);
 
         var listbox_scrolled = new Gtk.ScrolledWindow (null, null);
         listbox_scrolled.hscrollbar_policy = Gtk.PolicyType.NEVER;
@@ -67,8 +65,8 @@ public class Slingshot.Widgets.CategoryView : Gtk.Even
 
         add (container);
 
-        category_switcher.row_selected.connect ((row) => {
-            show_filtered_apps (((CategoryRow) row).cat_name);
+        category_switcher.row_selected.connect (() => {
+            listbox.invalidate_filter ();
         });
 
         category_switcher.search_focus_request.connect (() => {
@@ -201,6 +199,11 @@ public class Slingshot.Widgets.CategoryView : Gtk.Even
             child.destroy ();
         }
 
+        foreach (unowned Backend.App app in view.app_system.get_apps_by_name ()) {
+            listbox.add (new AppListRow (app.desktop_id, app.desktop_path));
+        }
+        listbox.show_all ();
+
         // Fill the sidebar
         unowned Gtk.ListBoxRow? new_selected = null;
         foreach (string cat_name in view.app_system.apps.keys) {
@@ -219,16 +222,18 @@ public class Slingshot.Widgets.CategoryView : Gtk.Even
         category_switcher.select_row (new_selected ?? category_switcher.get_row_at_index (0));
     }
 
-    public void show_filtered_apps (string category) {
-        foreach (unowned Gtk.Widget child in listbox.get_children ()) {
-            child.destroy ();
+    [CCode (instance_pos = -1)]
+    private bool filter_function (AppListRow row) {
+        unowned CategoryRow category_row = (CategoryRow) category_switcher.get_selected_row ();
+        if (category_row != null) {
+            foreach (Backend.App app in view.app_system.apps[category_row.cat_name]) {
+                if (row.app_id == app.desktop_id) {
+                    return true;
+                }
+            }
         }
 
-        foreach (Backend.App app in view.app_system.apps[category]) {
-            listbox.add (new AppListRow (app.desktop_id, app.desktop_path));
-        }
-
-        listbox.show_all ();
+        return false;
     }
 
     private bool on_key_press (Gdk.EventKey event) {
