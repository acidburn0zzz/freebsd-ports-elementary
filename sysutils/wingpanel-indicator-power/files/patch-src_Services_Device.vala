--- src/Services/Device.vala.orig	2021-08-23 17:38:33 UTC
+++ src/Services/Device.vala
@@ -184,12 +184,6 @@ public class Power.Services.Device : Object {
     }
 
     private void update_properties () {
-        try {
-            device.refresh ();
-        } catch (Error e) {
-            critical ("Updating the upower device parameters failed: %s", e.message);
-        }
-
         has_history = device.has_history;
         has_statistics = device.has_statistics;
         is_present = device.is_present;
