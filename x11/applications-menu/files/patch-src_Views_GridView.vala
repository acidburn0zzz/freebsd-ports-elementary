--- src/Views/GridView.vala.orig	2020-04-29 21:58:06 UTC
+++ src/Views/GridView.vala
@@ -28,7 +28,7 @@ public class Slingshot.Widgets.Grid : Gtk.Grid {
     private Gtk.Grid current_grid;
     private Gtk.Widget? focused_widget;
     private Gee.HashMap<int, Gtk.Grid> grids;
-    private Hdy.Paginator paginator;
+    private Hdy.Carousel paginator;
     private Page page;
 
     private int focused_column;
@@ -41,7 +41,7 @@ public class Slingshot.Widgets.Grid : Gtk.Grid {
         page.columns = 5;
         page.number = 1;
 
-        paginator = new Hdy.Paginator ();
+        paginator = new Hdy.Carousel ();
         paginator.expand = true;
 
         var page_switcher = new Widgets.Switcher ();
@@ -114,7 +114,7 @@ public class Slingshot.Widgets.Grid : Gtk.Grid {
                 current_grid.attach (new Gtk.Grid (), column, row, 1, 1);
     }
 
-    private Gtk.Widget? get_child_at (int column, int row) {
+    private Gtk.Widget? get_widget_at (int column, int row) {
         var col = ((int)(column / page.columns)) + 1;
 
         var grid = grids.get (col);
@@ -162,7 +162,7 @@ public class Slingshot.Widgets.Grid : Gtk.Grid {
     }
 
     private bool set_focus (int column, int row) {
-        var target_widget = get_child_at (column, row);
+        var target_widget = get_widget_at (column, row);
 
         if (target_widget != null) {
             go_to_number (((int) (column / page.columns)) + 1);
