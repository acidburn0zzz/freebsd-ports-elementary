--- src/LayoutsManager.vala.orig	2020-04-01 23:53:57 UTC
+++ src/LayoutsManager.vala
@@ -33,6 +33,8 @@ public class Keyboard.Widgets.LayoutManager : Gtk.Scro
         main_grid.orientation = Gtk.Orientation.VERTICAL;
 
         hscrollbar_policy = Gtk.PolicyType.NEVER;
+        max_content_height = 500;
+        propagate_natural_height = true;
         add (main_grid);
 
         settings = new GLib.Settings ("org.gnome.desktop.input-sources");
@@ -47,22 +49,6 @@ public class Keyboard.Widgets.LayoutManager : Gtk.Scro
         });
 
         show_all ();
-    }
-
-    public override void get_preferred_height (out int minimum_height, out int natural_height) {
-        List<weak Gtk.Widget> children = main_grid.get_children ();
-        weak Gtk.Widget? first_child = children.first ().data;
-        if (first_child == null) {
-            minimum_height = 0;
-            natural_height = 0;
-        } else {
-            var display = Gdk.Display.get_default ();
-            var monitor = display.get_primary_monitor ();
-            Gdk.Rectangle geom = monitor.get_geometry ();
-
-            main_grid.get_preferred_height (out minimum_height, out natural_height);
-            minimum_height = int.min (minimum_height, (int)(geom.height * 2 / 3));
-        }
     }
 
     private void populate_layouts () {
