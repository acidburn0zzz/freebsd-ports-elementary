--- src/InputSources/SourceSettings.vala.orig	2021-07-14 21:00:05 UTC
+++ src/InputSources/SourceSettings.vala
@@ -176,6 +176,71 @@ class Pantheon.Keyboard.SourceSettings : Object {
         input_sources.foreach (func);
     }
 
+    private string[] split_value (string val, string sep) {
+        string[] result = {};
+
+        result = val.split (sep);
+
+        if ("-" in result[0]) {
+            result = split_value (result[0], "-");
+        }
+
+        return result;
+    }
+
+    private string remove_last_double_quote (string val) {
+        int last_occurrence;
+        string result;
+
+        last_occurrence = val.index_of ("\"", 0);
+        result = "%s".printf (val.slice (0, last_occurrence));
+
+        return result;
+    }
+
+    /**
+     * Find keyboard layout (and sometimes keyboard variant)
+     * from /usr/share/vt/keymaps/*.kbd
+     * 'centraleuropean', 'colemak-dh', 'latinamerican', 'nordic'
+     * could be wrong values
+     */
+    private void heuristic_find_keymap (string keymap) {
+        string[] res;
+        string xkb_layout = "";
+        string xkb_variant = "";
+
+        res = split_value (keymap, ".");
+
+        if (res.length > 2) {
+            if ((res[1].contains ("dvorak")) || (res[1] == "macbook")) {
+                xkb_variant = "%s".printf (res[1]);
+                xkb_layout = "%s".printf (res[0]);
+            }
+            else {
+                xkb_layout = "%s".printf (res[0]);
+            }
+        }
+        else if (res.length == 2) {
+            if (res[1] != "kbd") {
+                xkb_variant = "%s".printf (res[1]);
+                xkb_layout = "%s".printf (res[0]);
+            }
+            else {
+                xkb_layout = "%s".printf (res[0]);
+            }
+        } else {
+            xkb_layout = "%s".printf (res[0]);
+        }
+
+        if (xkb_variant != "") {
+            add_layout_internal (InputSource.new_xkb (xkb_layout, xkb_variant));
+        } else {
+            add_layout_internal (InputSource.new_xkb (xkb_layout, null));
+        }
+
+        write_to_gsettings ();
+    }
+
     private void add_default_keyboard_if_required () {
         bool have_xkb = false;
         input_sources.@foreach ((source) => {
@@ -185,31 +250,26 @@ class Pantheon.Keyboard.SourceSettings : Object {
         });
 
         if (!have_xkb) {
-            var file = File.new_for_path ("/etc/default/keyboard");
+            GLib.File file;
 
+            file = GLib.File.new_for_path ("/etc/rc.conf");
+
             if (!file.query_exists ()) {
                 warning ("File '%s' doesn't exist.\n", file.get_path ());
                 return;
             }
 
-            string xkb_layout = "";
-            string xkb_variant = "";
-
             try {
-                var dis = new DataInputStream (file.read ());
-
+                GLib.DataInputStream dis;
                 string line;
 
-                while ((line = dis.read_line (null)) != null) {
-                    if (line.contains ("XKBLAYOUT=")) {
-                        xkb_layout = line.replace ("XKBLAYOUT=", "").replace ("\"", "");
+                dis = new GLib.DataInputStream (file.read ());
 
-                        while ((line = dis.read_line (null)) != null) {
-                            if (line.contains ("XKBVARIANT=")) {
-                                xkb_variant = line.replace ("XKBVARIANT=", "").replace ("\"", "");
-                            }
-                        }
 
+                while ((line = dis.read_line (null)) != null) {
+                    if (line.contains ("keymap=")) {
+                        heuristic_find_keymap (remove_last_double_quote (line.replace ("keymap=\"", "")));
+
                         break;
                     }
                 }
@@ -218,19 +278,6 @@ class Pantheon.Keyboard.SourceSettings : Object {
                 warning ("%s", e.message);
                 return;
             }
-
-            var variants = xkb_variant.split (",");
-            var xkb_layouts = xkb_layout.split (",");
-
-            for (int i = 0; i < xkb_layouts.length; i++) {
-                if (variants[i] != null && variants[i] != "") {
-                    add_layout_internal (InputSource.new_xkb (xkb_layouts[i], variants[i]));
-                } else {
-                    add_layout_internal (InputSource.new_xkb (xkb_layouts[i], null));
-                }
-            }
-
-            write_to_gsettings ();
         }
     }
 
