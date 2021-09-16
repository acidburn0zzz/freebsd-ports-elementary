--- src/Views/OperatingSystemView.vala.orig	2021-08-24 20:34:26 UTC
+++ src/Views/OperatingSystemView.vala
@@ -29,9 +29,9 @@ public class About.OperatingSystemView : Gtk.Grid {
 
         var uts_name = Posix.utsname ();
 
-        support_url = Environment.get_os_info (GLib.OsInfoKey.SUPPORT_URL);
+        support_url = Environment.get_os_info (GLib.OsInfoKey.SUPPORT_URL).down ();
         if (support_url == "" || support_url == null) {
-            support_url = "https://elementary.io/support";
+            support_url = "https://bugs.freebsd.org/";
         }
 
         var logo_icon_name = Environment.get_os_info ("LOGO");
@@ -72,7 +72,7 @@ public class About.OperatingSystemView : Gtk.Grid {
         // want more granular control over text formatting
         var pretty_name = "<b>%s</b> %s".printf (
             Environment.get_os_info (GLib.OsInfoKey.NAME),
-            Environment.get_os_info (GLib.OsInfoKey.VERSION)
+            Environment.get_os_info (GLib.OsInfoKey.VERSION_ID)
         );
 
         var title = new Gtk.Label (pretty_name) {
@@ -84,14 +84,14 @@ public class About.OperatingSystemView : Gtk.Grid {
         };
         title.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
 
-        var kernel_version_label = new Gtk.Label ("%s %s".printf (uts_name.sysname, uts_name.release)) {
+        var kernel_version_label = new Gtk.Label ("%s".printf (uts_name.release)) {
             selectable = true,
             xalign = 0
         };
 
-        var website_url = Environment.get_os_info (GLib.OsInfoKey.HOME_URL);
+        var website_url = Environment.get_os_info (GLib.OsInfoKey.HOME_URL).down ();
         if (website_url == "" || website_url == null) {
-            website_url = "https://elementary.io";
+            website_url = "https://freebsd.org/";
         }
 
         var website_label = new Gtk.LinkButton.with_label (website_url, _("Website")) {
@@ -176,37 +176,20 @@ public class About.OperatingSystemView : Gtk.Grid {
             }
         });
 
-        get_upstream_release.begin ();
+        get_upstream_release ();
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
+    // https://docs.freebsd.org/en/books/porters-handbook/versions/
+    [CCode (cheader_filename="unistd.h", cname="getosreldate")]
+    extern static int getosreldate ();
 
-        if (upstream_release != null) {
-            var based_off = new Gtk.Label (_("Built on %s").printf (upstream_release)) {
-                selectable = true,
-                xalign = 0
-            };
-            software_grid.attach (based_off, 1, 1, 3);
-            software_grid.show_all ();
-        }
+    private  void get_upstream_release () {
+        var based_off = new Gtk.Label (_("Built on %d").printf (getosreldate ())) {
+            selectable = true,
+            xalign = 0
+        };
+        software_grid.attach (based_off, 1, 1, 3);
+        software_grid.show_all ();
     }
 
     private void launch_support_url () {
@@ -265,7 +248,6 @@ public class About.OperatingSystemView : Gtk.Grid {
         string[] prefixes = {
             "org.pantheon.desktop",
             "io.elementary.desktop",
-            "io.elementary.onboarding",
             "io.elementary.wingpanel.keyboard",
             "org.gnome.desktop",
             "org.gnome.settings-daemon"
