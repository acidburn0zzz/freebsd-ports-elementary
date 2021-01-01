--- src/Services/TimeManager.vala.orig	2019-11-26 18:10:05 UTC
+++ src/Services/TimeManager.vala
@@ -17,7 +17,7 @@
  * Boston, MA 02110-1301 USA.
  */
 
-[DBus (name = "org.freedesktop.login1.Manager")]
+[DBus (name = "org.freedesktop.ConsoleKit.Manager")]
 interface Manager : Object {
     public signal void prepare_for_sleep (bool sleeping);
 }
@@ -60,10 +60,8 @@ public class DateTime.Services.TimeManager : Gtk.Calen
                 add_timeout ();
             });
 
-            // Listen for the D-BUS server that controls time settings
-            Bus.watch_name (BusType.SYSTEM, "org.freedesktop.timedate1", BusNameWatcherFlags.NONE, on_watch, on_unwatch);
             // Listen for the signal that is fired when waking up from sleep, then update time
-            manager = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1");
+            manager = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.ConsoleKit", "/org/freedesktop/ConsoleKit/Manager");
             manager.prepare_for_sleep.connect ((sleeping) => {
                 if (!sleeping) {
                     update_current_time ();
@@ -107,16 +105,6 @@ public class DateTime.Services.TimeManager : Gtk.Calen
 
             is_12h = ("12h" in clock_settings.get_string ("clock-format"));
         }
-    }
-
-    private void on_watch (DBusConnection conn) {
-        // Start updating the time display quicker because someone is changing settings
-        add_timeout (true);
-    }
-
-    private void on_unwatch (DBusConnection conn) {
-        // Stop updating the time display quicker
-        add_timeout (false);
     }
 
     private void add_timeout (bool update_fast = false) {
