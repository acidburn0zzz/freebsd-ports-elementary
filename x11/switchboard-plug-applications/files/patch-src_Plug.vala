--- src/Plug.vala.orig	2021-07-15 21:58:48 UTC
+++ src/Plug.vala
@@ -23,7 +23,6 @@
 public class ApplicationsPlug : Switchboard.Plug {
     private const string DEFAULTS = "defaults";
     private const string STARTUP = "startup";
-    private const string PERMISSIONS = "permissions";
 
     private Gtk.Grid grid;
     private Gtk.Stack stack;
@@ -33,7 +32,6 @@ public class ApplicationsPlug : Switchboard.Plug {
         settings.set ("applications", null);
         settings.set ("applications/defaults", DEFAULTS);
         settings.set ("applications/startup", STARTUP);
-        settings.set ("applications/permissions", PERMISSIONS);
 
         Object (
             category: Category.PERSONAL,
@@ -52,7 +50,6 @@ public class ApplicationsPlug : Switchboard.Plug {
             };
             stack.add_titled (new Defaults.Plug (), DEFAULTS, _("Defaults"));
             stack.add_titled (new Startup.Plug (), STARTUP, _("Startup"));
-            stack.add_titled (new Permissions.Plug (), PERMISSIONS, _("Permissions"));
 
             var stack_switcher = new Gtk.StackSwitcher () {
                 halign = Gtk.Align.CENTER,
@@ -82,7 +79,6 @@ public class ApplicationsPlug : Switchboard.Plug {
         switch (location) {
             case STARTUP:
             case DEFAULTS:
-            case PERMISSIONS:
                 stack.set_visible_child_name (location);
                 break;
             default:
@@ -98,9 +94,6 @@ public class ApplicationsPlug : Switchboard.Plug {
         );
         search_results.set ("%s → %s".printf (display_name, _("Startup")), STARTUP);
         search_results.set ("%s → %s".printf (display_name, _("Default Apps")), DEFAULTS);
-        search_results.set ("%s → %s".printf (display_name, _("Permissions")), PERMISSIONS);
-        search_results.set ("%s → %s".printf (display_name, _("Sandboxing")), PERMISSIONS);
-        search_results.set ("%s → %s".printf (display_name, _("Confinement")), PERMISSIONS);
         search_results.set ("%s → %s → %s".printf (display_name, _("Default"), _("Web Browser")), DEFAULTS);
         search_results.set ("%s → %s → %s".printf (display_name, _("Default"), _("Email Client")), DEFAULTS);
         search_results.set ("%s → %s → %s".printf (display_name, _("Default"), _("Calendar")), DEFAULTS);
