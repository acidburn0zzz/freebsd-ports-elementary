--- src/MainWindow.vala.orig	2021-07-14 19:41:27 UTC
+++ src/MainWindow.vala
@@ -60,8 +60,6 @@ public class Greeter.MainWindow : Gtk.ApplicationWindo
 
         set_visual (get_screen ().get_rgba_visual ());
 
-        var guest_login_button = new Gtk.Button.with_label (_("Log in as Guest"));
-
         manual_login_button = new Gtk.ToggleButton.with_label (_("Manual Login…"));
 
         var extra_login_grid = new Gtk.Grid ();
@@ -76,7 +74,6 @@ public class Greeter.MainWindow : Gtk.ApplicationWindo
             gtksettings.gtk_theme_name = "io.elementary.stylesheet.blueberry";
 
             var css_provider = Gtk.CssProvider.get_named (gtksettings.gtk_theme_name, "dark");
-            guest_login_button.get_style_context ().add_provider (css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
             manual_login_button.get_style_context ().add_provider (css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
         } catch (Error e) {}
 
@@ -139,14 +136,6 @@ public class Greeter.MainWindow : Gtk.ApplicationWindo
             }
         });
 
-        guest_login_button.clicked.connect (() => {
-            try {
-                lightdm_greeter.authenticate_as_guest ();
-            } catch (Error e) {
-                critical (e.message);
-            }
-        });
-
         GLib.ActionEntry entries[] = {
             GLib.ActionEntry () {
                 name = "previous",
@@ -169,13 +158,6 @@ public class Greeter.MainWindow : Gtk.ApplicationWindo
         lightdm_greeter.show_prompt.connect (show_prompt);
         lightdm_greeter.authentication_complete.connect (authentication_complete);
 
-        lightdm_greeter.notify["has-guest-account-hint"].connect (() => {
-            if (lightdm_greeter.has_guest_account_hint && guest_login_button.parent == null) {
-                extra_login_grid.attach (guest_login_button, 0, 0);
-                guest_login_button.show ();
-            }
-        });
-
         lightdm_greeter.notify["show-manual-login-hint"].connect (() => {
             if (lightdm_greeter.show_manual_login_hint && manual_login_button.parent == null) {
                 extra_login_grid.attach (manual_login_button, 1, 0);
@@ -433,7 +415,6 @@ public class Greeter.MainWindow : Gtk.ApplicationWindo
         }
 
         lightdm_greeter.notify_property ("show-manual-login-hint");
-        lightdm_greeter.notify_property ("has-guest-account-hint");
 
         if (lightdm_greeter.default_session_hint != null) {
             get_action_group ("session").activate_action ("select", new GLib.Variant.string (lightdm_greeter.default_session_hint));
