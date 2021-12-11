--- src/ExternalWindow.vala.orig	2021-10-28 08:07:25 UTC
+++ src/ExternalWindow.vala
@@ -70,8 +70,8 @@ public class ExternalWindowX11 : ExternalWindow, GLib.
         }
 
         Gdk.set_allowed_backends ("x11");
-        x11_display = Gdk.Display.open (null);
-        Gdk.set_allowed_backends (null);
+        x11_display = Gdk.Display.open ("");
+        Gdk.set_allowed_backends ("");
 
         if (x11_display == null) {
             warning ("Failed to open X11 display");
