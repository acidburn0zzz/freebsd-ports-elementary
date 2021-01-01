--- src/Background/BackgroundSource.vala.orig	2020-04-30 22:23:37 UTC
+++ src/Background/BackgroundSource.vala
@@ -119,7 +119,7 @@ namespace Gala {
             screen.monitors_changed.disconnect (monitors_changed);
 #endif
 
-            foreach (var background in backgrounds) {
+            foreach (var background in backgrounds.values) {
                 background.changed.disconnect (background_changed);
                 background.destroy ();
             }
