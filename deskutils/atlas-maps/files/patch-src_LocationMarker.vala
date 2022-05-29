--- src/LocationMarker.vala.orig	2021-12-28 22:19:45 UTC
+++ src/LocationMarker.vala
@@ -7,7 +7,7 @@ public class Atlas.LocationMarker : Champlain.Marker {
 
     public LocationMarker () {
         try {
-            var pixbuf = new Gdk.Pixbuf.from_file ("%s/LocationMarker.svg".printf (Build.PKGDATADIR));
+            var pixbuf = new Gdk.Pixbuf.from_file ("%s/%s/LocationMarker.svg".printf (Build.PKGDATADIR, "atlas"));
             var image = new Clutter.Image ();
             image.set_data (pixbuf.get_pixels (),
                           pixbuf.has_alpha ? Cogl.PixelFormat.RGBA_8888 : Cogl.PixelFormat.RGB_888,
