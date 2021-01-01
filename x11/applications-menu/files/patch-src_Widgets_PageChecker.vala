--- src/Widgets/PageChecker.vala.orig	2020-04-29 21:58:06 UTC
+++ src/Widgets/PageChecker.vala
@@ -22,13 +22,13 @@
 public class Slingshot.Widgets.PageChecker : Gtk.Button {
     public const double MIN_OPACITY = 0.4;
 
-    public unowned Hdy.Paginator paginator { get; construct; }
+    public unowned Hdy.Carousel paginator { get; construct; }
     public unowned Gtk.Widget page { get; construct; }
 
     private static Gtk.CssProvider provider;
     private int page_number;
 
-    public PageChecker (Hdy.Paginator paginator, Gtk.Widget page) {
+    public PageChecker (Hdy.Carousel paginator, Gtk.Widget page) {
         Object (
             paginator: paginator,
             page: page
