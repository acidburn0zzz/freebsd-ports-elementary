--- src/Indicator.vala.orig	2021-07-13 23:28:32 UTC
+++ src/Indicator.vala
@@ -94,9 +94,6 @@ public class Session.Indicator : Wingpanel.Indicator {
             main_grid = new Gtk.Grid ();
             main_grid.set_orientation (Gtk.Orientation.VERTICAL);
 
-            var user_settings = new Gtk.ModelButton ();
-            user_settings.text = _("User Accounts Settings…");
-
             var log_out_grid = new Granite.AccelLabel (_("Log Out…"));
 
             log_out = new Gtk.ModelButton () {
@@ -144,7 +141,6 @@ public class Session.Indicator : Wingpanel.Indicator {
                 scrolled_box.add (manager.user_grid);
 
                 main_grid.add (scrolled_box);
-                main_grid.add (user_settings);
                 main_grid.add (users_separator);
                 main_grid.add (lock_screen);
                 main_grid.add (log_out);
@@ -184,16 +180,6 @@ public class Session.Indicator : Wingpanel.Indicator {
 
             manager.close.connect (() => close ());
 
-            user_settings.clicked.connect (() => {
-                close ();
-
-                try {
-                    AppInfo.launch_default_for_uri ("settings://accounts", null);
-                } catch (Error e) {
-                    warning ("Failed to open user accounts settings: %s", e.message);
-                }
-            });
-
             shutdown.clicked.connect (() => {
                 show_shutdown_dialog ();
             });
@@ -256,7 +242,7 @@ public class Session.Indicator : Wingpanel.Indicator {
 
     private async void init_interfaces () {
         try {
-            system_interface = yield Bus.get_proxy (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1");
+            system_interface = yield Bus.get_proxy (BusType.SYSTEM, "org.freedesktop.ConsoleKit", "/org/freedesktop/ConsoleKit/Manager");
             suspend.sensitive = true;
         } catch (IOError e) {
             critical ("Unable to connect to the login interface: %s", e.message);
