--- src/Views/OperatingSystemView.vala.orig	2021-08-24 20:34:26 UTC
+++ src/Views/OperatingSystemView.vala
@@ -31,7 +31,7 @@ public class About.OperatingSystemView : Gtk.Grid {
 
         support_url = Environment.get_os_info (GLib.OsInfoKey.SUPPORT_URL);
         if (support_url == "" || support_url == null) {
-            support_url = "https://elementary.io/support";
+            support_url = "https://bugs.FreeBSD.org/";
         }
 
         var logo_icon_name = Environment.get_os_info ("LOGO");
@@ -91,7 +91,7 @@ public class About.OperatingSystemView : Gtk.Grid {
 
         var website_url = Environment.get_os_info (GLib.OsInfoKey.HOME_URL);
         if (website_url == "" || website_url == null) {
-            website_url = "https://elementary.io";
+            website_url = "https://freebsd.org/";
         }
 
         var website_label = new Gtk.LinkButton.with_label (website_url, _("Website")) {
@@ -175,40 +175,8 @@ public class About.OperatingSystemView : Gtk.Grid {
                 launch_support_url ();
             }
         });
-
-        get_upstream_release.begin ();
     }
 
-    private async void get_upstream_release () {
-        // Upstream distro version (for "Built on" text)
-        // FIXME: Add distro specific field to /etc/os-release and use that instead
-        // Like "ELEMENTARY_UPSTREAM_DISTRO_NAME" or something
-        var file = File.new_for_path ("/etc/upstream-release/lsb-release");
-        string? upstream_release = null;
-        try {
-            var dis = new DataInputStream (yield file.read_async ());
-            string line;
-            // Read lines until end of file (null) is reached
-            while ((line = yield dis.read_line_async ()) != null) {
-                var distrib_component = line.split ("=", 2);
-                if (distrib_component.length == 2) {
-                    upstream_release = distrib_component[1].replace ("\"", "");
-                }
-            }
-        } catch (Error e) {
-            warning ("Couldn't read upstream lsb-release file, assuming none");
-        }
-
-        if (upstream_release != null) {
-            var based_off = new Gtk.Label (_("Built on %s").printf (upstream_release)) {
-                selectable = true,
-                xalign = 0
-            };
-            software_grid.attach (based_off, 1, 1, 3);
-            software_grid.show_all ();
-        }
-    }
-
     private void launch_support_url () {
         try {
             AppInfo.launch_default_for_uri (support_url, null);
@@ -265,7 +233,6 @@ public class About.OperatingSystemView : Gtk.Grid {
         string[] prefixes = {
             "org.pantheon.desktop",
             "io.elementary.desktop",
-            "io.elementary.onboarding",
             "io.elementary.wingpanel.keyboard",
             "org.gnome.desktop",
             "org.gnome.settings-daemon"
