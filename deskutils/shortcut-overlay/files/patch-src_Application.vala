--- src/Application.vala.orig	2020-05-28 18:52:24 UTC
+++ src/Application.vala
@@ -25,7 +25,7 @@ public class ShortcutOverlay.Application : Gtk.Applica
 
     protected override void activate () {
         unowned List<Gtk.Window> windows = get_windows ();
-        if (windows.length () > 0 && !windows.data.visible) {
+        if (windows.length () > 0) {
             windows.data.destroy ();
             return;
         }
