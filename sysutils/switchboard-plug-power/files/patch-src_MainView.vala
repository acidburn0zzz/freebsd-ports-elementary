--- src/MainView.vala.orig	2022-05-18 05:01:37 UTC
+++ src/MainView.vala
@@ -117,65 +117,6 @@ public class Power.MainView : Gtk.Grid {
             label_size.add_widget (als_label);
         }
 
-        if (lid_detect ()) {
-            var lid_closed_label = new Gtk.Label (_("When lid is closed:")) {
-                halign = Gtk.Align.END,
-                xalign = 1
-            };
-
-            var lid_closed_box = new LidCloseActionComboBox (false);
-
-            var lid_dock_label = new Gtk.Label (_("When lid is closed with external monitor:")) {
-                halign = Gtk.Align.END,
-                xalign = 1
-            };
-
-            var lid_dock_box = new LidCloseActionComboBox (true);
-
-            label_size.add_widget (lid_closed_label);
-            label_size.add_widget (lid_dock_label);
-
-            var lock_image = new Gtk.Image.from_icon_name ("changes-prevent-symbolic", Gtk.IconSize.BUTTON) {
-                sensitive = false,
-                tooltip_text = NO_PERMISSION_STRING
-            };
-
-            var lock_image2 = new Gtk.Image.from_icon_name ("changes-prevent-symbolic", Gtk.IconSize.BUTTON) {
-                sensitive = false,
-                tooltip_text = NO_PERMISSION_STRING
-            };
-
-            main_grid.attach (lid_closed_label, 0, 5);
-            main_grid.attach (lid_closed_box, 1, 5);
-            main_grid.attach (lock_image2, 2, 5);
-            main_grid.attach (lid_dock_label, 0, 6);
-            main_grid.attach (lid_dock_box, 1, 6);
-            main_grid.attach (lock_image, 2, 6);
-
-            var lock_button = new Gtk.LockButton (get_permission ());
-
-            var permission_label = new Gtk.Label (_("Some settings require administrator rights to be changed"));
-
-            var permission_infobar = new Gtk.InfoBar () {
-                message_type = Gtk.MessageType.INFO
-            };
-            permission_infobar.get_content_area ().add (permission_label);
-
-            var area_infobar = permission_infobar.get_action_area () as Gtk.Container;
-            area_infobar.add (lock_button);
-
-            add (permission_infobar);
-
-            var permission = get_permission ();
-            permission.bind_property ("allowed", lid_closed_box, "sensitive", GLib.BindingFlags.SYNC_CREATE);
-            permission.bind_property ("allowed", lid_closed_label, "sensitive", GLib.BindingFlags.SYNC_CREATE);
-            permission.bind_property ("allowed", lid_dock_box, "sensitive", GLib.BindingFlags.SYNC_CREATE);
-            permission.bind_property ("allowed", lid_dock_label, "sensitive", GLib.BindingFlags.SYNC_CREATE);
-            permission.bind_property ("allowed", lock_image, "visible", GLib.BindingFlags.SYNC_CREATE | GLib.BindingFlags.INVERT_BOOLEAN);
-            permission.bind_property ("allowed", lock_image2, "visible", GLib.BindingFlags.SYNC_CREATE | GLib.BindingFlags.INVERT_BOOLEAN);
-            permission.bind_property ("allowed", permission_infobar, "revealed", GLib.BindingFlags.SYNC_CREATE | GLib.BindingFlags.INVERT_BOOLEAN);
-        }
-
         var screen_timeout_label = new Gtk.Label (_("Turn off display when inactive for:")) {
             halign = Gtk.Align.END,
             xalign = 1
@@ -280,18 +221,6 @@ public class Power.MainView : Gtk.Grid {
 
         add (infobar);
 
-        var power_mode_button = new PowerModeButton () {
-            halign = Gtk.Align.START
-        };
-        if (power_mode_button.pprofile != null) {
-            var power_mode_label = new Gtk.Label (_("Power management mode:")) {
-                xalign = 1
-            };
-
-            main_grid.attach (power_mode_label, 0, 9);
-            main_grid.attach (power_mode_button, 1, 9);
-        }
-
         add (main_grid);
         show_all ();
 
@@ -318,7 +247,7 @@ public class Power.MainView : Gtk.Grid {
     }
 
     private static bool backlight_detect () {
-        var interface_path = File.new_for_path ("/sys/class/backlight/");
+        var interface_path = File.new_for_path ("/dev/backlight/");
 
         try {
             var enumerator = interface_path.enumerate_children (
@@ -330,32 +259,9 @@ public class Power.MainView : Gtk.Grid {
                 return true;
             }
 
-        enumerator.close ();
-
-        } catch (GLib.Error err) {
-            critical (err.message);
-        }
-
-        return false;
-    }
-
-    private static bool lid_detect () {
-        var interface_path = File.new_for_path ("/proc/acpi/button/lid/");
-
-        try {
-            var enumerator = interface_path.enumerate_children (
-            GLib.FileAttribute.STANDARD_NAME,
-            FileQueryInfoFlags.NONE);
-            FileInfo lid;
-            if ((lid = enumerator.next_file ()) != null) {
-                debug ("Detected lid switch");
-                return true;
-            }
-
             enumerator.close ();
-
         } catch (GLib.Error err) {
-            warning (err.message); // Not critical as this is eventually dealt with
+            warning (err.message);
         }
 
         return false;
