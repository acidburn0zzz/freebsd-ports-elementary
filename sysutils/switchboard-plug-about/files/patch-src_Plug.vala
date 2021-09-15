--- src/Plug.vala.orig	2021-08-24 20:34:26 UTC
+++ src/Plug.vala
@@ -21,7 +21,6 @@
 public class About.Plug : Switchboard.Plug {
     private const string OPERATING_SYSTEM = "operating-system";
     private const string HARDWARE = "hardware";
-    private const string FIRMWARE = "firmware";
 
     private Gtk.Grid main_grid;
     private Gtk.Stack stack;
@@ -34,7 +33,6 @@ public class About.Plug : Switchboard.Plug {
         settings.set ("about", null);
         settings.set ("about/os", OPERATING_SYSTEM);
         settings.set ("about/hardware", HARDWARE);
-        settings.set ("about/firmware", FIRMWARE);
 
         Object (
             category: Category.SYSTEM,
@@ -54,14 +52,11 @@ public class About.Plug : Switchboard.Plug {
                 valign = Gtk.Align.CENTER
             };
 
-            var firmware_view = new FirmwareView ();
-
             stack = new Gtk.Stack () {
                 vexpand = true
             };
             stack.add_titled (operating_system_view, OPERATING_SYSTEM, _("Operating System"));
             stack.add_titled (hardware_view, HARDWARE, _("Hardware"));
-            stack.add_titled (firmware_view, FIRMWARE, _("Firmware"));
 
             var stack_switcher = new Gtk.StackSwitcher () {
                 halign = Gtk.Align.CENTER,
@@ -91,7 +86,6 @@ public class About.Plug : Switchboard.Plug {
         switch (location) {
             case OPERATING_SYSTEM:
             case HARDWARE:
-            case FIRMWARE:
                 stack.set_visible_child_name (location);
                 break;
             default:
@@ -109,13 +103,11 @@ public class About.Plug : Switchboard.Plug {
 
         search_results.set ("%s → %s".printf (display_name, _("Operating System Information")), OPERATING_SYSTEM);
         search_results.set ("%s → %s".printf (display_name, _("Hardware Information")), HARDWARE);
-        search_results.set ("%s → %s".printf (display_name, _("Firmware")), FIRMWARE);
         search_results.set ("%s → %s".printf (display_name, _("Restore Default Settings")), OPERATING_SYSTEM);
         search_results.set ("%s → %s".printf (display_name, _("Suggest Translations")), OPERATING_SYSTEM);
         search_results.set ("%s → %s".printf (display_name, _("Send Feedback")), OPERATING_SYSTEM);
         search_results.set ("%s → %s".printf (display_name, _("Report a Problem")), OPERATING_SYSTEM);
         search_results.set ("%s → %s".printf (display_name, _("Get Support")), OPERATING_SYSTEM);
-        search_results.set ("%s → %s".printf (display_name, _("Updates")), OPERATING_SYSTEM);
 
         return search_results;
     }
