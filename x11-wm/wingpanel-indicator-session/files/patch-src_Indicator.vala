--- src/Indicator.vala.orig	2021-07-13 23:28:32 UTC
+++ src/Indicator.vala
@@ -256,7 +256,7 @@ public class Session.Indicator : Wingpanel.Indicator {
 
     private async void init_interfaces () {
         try {
-            system_interface = yield Bus.get_proxy (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1");
+            system_interface = yield Bus.get_proxy (BusType.SYSTEM, "org.freedesktop.ConsoleKit", "/org/freedesktop/ConsoleKit/Manager");
             suspend.sensitive = true;
         } catch (IOError e) {
             critical ("Unable to connect to the login interface: %s", e.message);
