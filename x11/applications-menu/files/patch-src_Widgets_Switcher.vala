--- src/Widgets/Switcher.vala.orig	2020-04-29 21:58:06 UTC
+++ src/Widgets/Switcher.vala
@@ -26,7 +26,7 @@ public class Slingshot.Widgets.Switcher : Gtk.Grid {
         }
     }
 
-    private Hdy.Paginator paginator;
+    private Hdy.Carousel paginator;
 
     construct {
         halign = Gtk.Align.CENTER;
@@ -36,7 +36,7 @@ public class Slingshot.Widgets.Switcher : Gtk.Grid {
         show_all ();
     }
 
-    public void set_paginator (Hdy.Paginator paginator) {
+    public void set_paginator (Hdy.Carousel paginator) {
         if (this.paginator != null) {
             get_children ().foreach ((child) => {
                 child.destroy ();
