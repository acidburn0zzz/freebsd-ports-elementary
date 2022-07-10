--- src/MainView.vala.orig	2022-05-18 05:01:37 UTC
+++ src/MainView.vala
@@ -103,7 +103,12 @@ public class Power.MainView : Gtk.Grid {
                 width_request = 480
             };
 
-            scale.set_value (screen.brightness);
+            if (screen.brightness == -1) {
+                scale.set_value (get_backlight_value ());
+            }
+            else {
+                scale.set_value (screen.brightness);
+            }
 
             scale.value_changed.connect (on_scale_value_changed);
             ((DBusProxy)screen).g_properties_changed.connect (on_screen_properties_changed);
@@ -117,65 +122,6 @@ public class Power.MainView : Gtk.Grid {
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
@@ -280,18 +226,6 @@ public class Power.MainView : Gtk.Grid {
 
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
 
@@ -303,6 +237,40 @@ public class Power.MainView : Gtk.Grid {
         stack_switcher.visible = stack.get_children ().length () > 1;
     }
 
+    private static int get_backlight_value () {
+        string command = "/usr/bin/backlight";
+        string stdout_buf;
+
+        try {
+            var sub_process = new GLib.Subprocess (GLib.SubprocessFlags.STDOUT_PIPE, command, "-q");
+            sub_process.communicate_utf8 (null, null, out stdout_buf, null);
+
+            if (stdout_buf != "") {
+                return int.parse (stdout_buf.replace ("\n", ""));
+            }
+        } catch (GLib.Error e) {
+            warning (e.message);
+        }
+        return 100;
+    }
+
+    private static void set_backlight_value (int val) {
+        string command = "/usr/bin/backlight";
+        string input_str = val.to_string ();
+        string stderr_buf;
+
+        try {
+            var sub_process = new GLib.Subprocess (GLib.SubprocessFlags.STDERR_PIPE, command, input_str);
+            sub_process.communicate_utf8 (null, null, null, out stderr_buf);
+
+            if (stderr_buf != "") {
+                warning ("no value changed");
+            }
+        } catch (GLib.Error e) {
+            warning (e.message);
+        }
+    }
+
     private static Polkit.Permission? get_permission () {
         if (permission != null) {
             return permission;
@@ -318,7 +286,7 @@ public class Power.MainView : Gtk.Grid {
     }
 
     private static bool backlight_detect () {
-        var interface_path = File.new_for_path ("/sys/class/backlight/");
+        var interface_path = File.new_for_path ("/dev/backlight/");
 
         try {
             var enumerator = interface_path.enumerate_children (
@@ -330,32 +298,9 @@ public class Power.MainView : Gtk.Grid {
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
@@ -363,6 +308,7 @@ public class Power.MainView : Gtk.Grid {
 
     private void on_scale_value_changed () {
         var val = (int) scale.get_value ();
+        set_backlight_value (val);
         ((DBusProxy)screen).g_properties_changed.disconnect (on_screen_properties_changed);
         screen.brightness = val;
         ((DBusProxy)screen).g_properties_changed.connect (on_screen_properties_changed);
