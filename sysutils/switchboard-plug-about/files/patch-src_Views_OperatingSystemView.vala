--- src/Views/OperatingSystemView.vala.orig	2022-04-06 18:14:50 UTC
+++ src/Views/OperatingSystemView.vala
@@ -31,7 +31,7 @@ public class About.OperatingSystemView : Gtk.Grid {
 
         support_url = Environment.get_os_info (GLib.OsInfoKey.SUPPORT_URL);
         if (support_url == "" || support_url == null) {
-            support_url = "https://elementary.io/support";
+            support_url = "https://bugs.freebsd.org/";
         }
 
         var logo_icon_name = Environment.get_os_info ("LOGO");
@@ -84,14 +84,9 @@ public class About.OperatingSystemView : Gtk.Grid {
         };
         title.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
 
-        var kernel_version_label = new Gtk.Label ("%s %s".printf (uts_name.sysname, uts_name.release)) {
-            selectable = true,
-            xalign = 0
-        };
-
-        var website_url = Environment.get_os_info (GLib.OsInfoKey.HOME_URL);
+        var website_url = Environment.get_os_info (GLib.OsInfoKey.HOME_URL).down ();
         if (website_url == "" || website_url == null) {
-            website_url = "https://elementary.io";
+            website_url = "https://freebsd.org/";
         }
 
         var website_label = new Gtk.LinkButton.with_label (website_url, _("Website")) {
@@ -112,8 +107,6 @@ public class About.OperatingSystemView : Gtk.Grid {
             margin_top = 12
         };
 
-        var bug_button = new Gtk.Button.with_label (_("Send Feedback"));
-
         Gtk.Button? update_button = null;
         var appcenter_info = new GLib.DesktopAppInfo ("io.elementary.appcenter.desktop");
         if (appcenter_info != null) {
@@ -131,7 +124,6 @@ public class About.OperatingSystemView : Gtk.Grid {
             spacing = 6
         };
         button_grid.add (settings_restore_button);
-        button_grid.add (bug_button);
         if (update_button != null) {
             button_grid.add (update_button);
         }
@@ -148,7 +140,6 @@ public class About.OperatingSystemView : Gtk.Grid {
         software_grid.attach (logo_overlay, 0, 0, 1, 4);
         software_grid.attach (title, 1, 0, 3);
 
-        software_grid.attach (kernel_version_label, 1, 2, 3);
         software_grid.attach (website_label, 1, 3);
         software_grid.attach (help_button, 2, 3);
         software_grid.attach (translate_button, 3, 3);
@@ -162,61 +153,22 @@ public class About.OperatingSystemView : Gtk.Grid {
 
         settings_restore_button.clicked.connect (settings_restore_clicked);
 
-        bug_button.clicked.connect (() => {
-            var appinfo = new GLib.DesktopAppInfo ("io.elementary.feedback.desktop");
-            if (appinfo != null) {
-                try {
-                    appinfo.launch (null, null);
-                } catch (Error e) {
-                    critical (e.message);
-                    launch_support_url ();
-                }
-            } else {
-                launch_support_url ();
-            }
-        });
-
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
+    private void get_upstream_release () {
+        var based_off = new Gtk.Label (_("Built on %d").printf (getosreldate ())) {
+            selectable = true,
+            xalign = 0
+        };
+        software_grid.attach (based_off, 1, 1, 3);
+        software_grid.show_all ();
     }
 
-    private void launch_support_url () {
-        try {
-            AppInfo.launch_default_for_uri (support_url, null);
-        } catch (Error e) {
-            critical (e.message);
-        }
-    }
-
      /**
      * returns true to continue, false to cancel
      */
@@ -265,7 +217,6 @@ public class About.OperatingSystemView : Gtk.Grid {
         string[] prefixes = {
             "org.pantheon.desktop",
             "io.elementary.desktop",
-            "io.elementary.onboarding",
             "io.elementary.wingpanel.keyboard",
             "org.gnome.desktop",
             "org.gnome.settings-daemon"
