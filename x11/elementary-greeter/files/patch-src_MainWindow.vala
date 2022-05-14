--- src/MainWindow.vala.orig	2022-05-10 16:52:42 UTC
+++ src/MainWindow.vala
@@ -61,6 +61,7 @@ public class Greeter.MainWindow : Gtk.ApplicationWindo
         set_visual (get_screen ().get_rgba_visual ());
 
         var guest_login_button = new Gtk.Button.with_label (_("Log in as Guest"));
+        guest_login_button.set_sensitive (false);
 
         manual_login_button = new Gtk.ToggleButton.with_label (_("Manual Login…"));
 
