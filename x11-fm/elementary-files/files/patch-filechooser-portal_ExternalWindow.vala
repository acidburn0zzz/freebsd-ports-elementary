--- filechooser-portal/ExternalWindow.vala.orig	2021-12-09 19:18:28 UTC
+++ filechooser-portal/ExternalWindow.vala
@@ -77,8 +77,8 @@ public class ExternalWindowX11 : ExternalWindow, GLib.
         }
 
         Gdk.set_allowed_backends ("x11");
-        x11_display = Gdk.Display.open (null);
-        Gdk.set_allowed_backends (null);
+        x11_display = Gdk.Display.open ("");
+        //Gdk.set_allowed_backends (null);
 
         if (x11_display == null) {
             warning ("Failed to open X11 display");
@@ -112,8 +112,8 @@ public class ExternalWindowWayland : ExternalWindow, G
         }
 
         Gdk.set_allowed_backends ("wayland");
-        wayland_display = Gdk.Display.open (null);
-        Gdk.set_allowed_backends (null);
+        wayland_display = Gdk.Display.open ("");
+        //Gdk.set_allowed_backends (null);
 
         if (wayland_display == null) {
             warning ("Failed to open Wayland display");
