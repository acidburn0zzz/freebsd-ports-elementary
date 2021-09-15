--- src/Interfaces/LoginManager.vala.orig	2021-08-24 20:34:26 UTC
+++ src/Interfaces/LoginManager.vala
@@ -19,7 +19,7 @@
  * Authored by: Marius Meisenzahl <mariusmeisenzahl@gmail.com>
  */
 
-[DBus (name = "org.freedesktop.login1.Manager")]
+[DBus (name = "org.freedesktop.ConsoleKit.Manager")]
 public interface About.LoginInterface : Object {
     public abstract void reboot (bool interactive) throws GLib.Error;
     public abstract void power_off (bool interactive) throws GLib.Error;
@@ -41,7 +41,7 @@ public class About.LoginManager : Object {
 
     construct {
         try {
-            interface = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1");
+            interface = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.ConsoleKit.Manager", "/org/freedesktop/ConsoleKit/Manager");
         } catch (Error e) {
             warning ("Could not connect to login interface: %s", e.message);
         }
