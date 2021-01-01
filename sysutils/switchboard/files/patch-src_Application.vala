--- src/Application.vala.orig	2020-04-30 20:47:16 UTC
+++ src/Application.vala
@@ -21,10 +21,7 @@
 
 namespace Switchboard {
     public static int main (string[] args) {
-        // Only known plug that requires GtkClutter is switchboard-plug-display
-        GtkClutter.init (ref args);
-
-        var app = SwitchboardApp.instance;
+        var app = new SwitchboardApp ();
         return app.run (args);
     }
 
@@ -64,16 +61,6 @@ namespace Switchboard {
             }
         }
 
-        private static SwitchboardApp _instance = null;
-        public static unowned SwitchboardApp instance {
-            get {
-                if (_instance == null) {
-                    _instance = new SwitchboardApp ();
-                }
-                return _instance;
-            }
-        }
-
         public override void open (File[] files, string hint) {
             var file = files[0];
             if (file == null) {
@@ -85,17 +72,8 @@ namespace Switchboard {
                 if (link.has_suffix ("/")) {
                     link = link.substring (0, link.last_index_of_char ('/'));
                 }
-
             } else {
-                warning ("Calling Switchboard directly is deprecated, please use the settings:// scheme instead");
-                var name = file.get_basename ();
-                if (":" in name) {
-                    var parts = name.split (":");
-                    plug_to_open = gcc_to_switchboard_code_name (parts[0]);
-                    open_window = parts[1];
-                } else {
-                    plug_to_open = gcc_to_switchboard_code_name (name);
-                }
+                critical ("Calling Switchboard directly is unsupported, please use the settings:// scheme instead");
             }
 
             activate ();
@@ -149,57 +127,6 @@ namespace Switchboard {
             loaded_plugs = new Gee.LinkedList <string> ();
             previous_plugs = new Gee.ArrayList <Switchboard.Plug> ();
 
-            build ();
-
-            Gtk.main ();
-        }
-
-        public void load_plug (Switchboard.Plug plug) {
-            Idle.add (() => {
-                if (!loaded_plugs.contains (plug.code_name)) {
-                    stack.add_named (plug.get_widget (), plug.code_name);
-                    loaded_plugs.add (plug.code_name);
-                }
-
-                category_view.plug_search_result.foreach ((entry) => {
-                    if (plug.display_name == entry.plug_name) {
-                        if (entry.open_window == null) {
-                            plug.search_callback (""); // open default in the switch
-                        } else {
-                            plug.search_callback (entry.open_window);
-                        }
-                        debug ("open section:%s of plug: %s", entry.open_window, plug.display_name);
-                        return true;
-                    }
-
-                    return false;
-                });
-
-                if (previous_plugs.size == 0 || previous_plugs.@get (0) != plug) {
-                    previous_plugs.add (plug);
-                }
-
-                search_box.text = "";
-
-                // Launch plug's executable
-                navigation_button.label = all_settings_label;
-                navigation_button.show ();
-
-                headerbar.title = plug.display_name;
-                current_plug = plug;
-
-                // open window was set by command line argument
-                if (open_window != null) {
-                    plug.search_callback (open_window);
-                    open_window = null;
-                }
-
-                switch_to_plug (plug);
-                return false;
-            }, GLib.Priority.DEFAULT_IDLE);
-        }
-
-        private void build () {
             var back_action = new SimpleAction ("back", null);
             var quit_action = new SimpleAction ("quit", null);
 
@@ -378,8 +305,55 @@ namespace Switchboard {
                 search_box.sensitive = true;
                 search_box.has_focus = true;
             }
+
+            Gtk.main ();
         }
 
+        public void load_plug (Switchboard.Plug plug) {
+            Idle.add (() => {
+                if (!loaded_plugs.contains (plug.code_name)) {
+                    stack.add_named (plug.get_widget (), plug.code_name);
+                    loaded_plugs.add (plug.code_name);
+                }
+
+                category_view.plug_search_result.foreach ((entry) => {
+                    if (plug.display_name == entry.plug_name) {
+                        if (entry.open_window == null) {
+                            plug.search_callback (""); // open default in the switch
+                        } else {
+                            plug.search_callback (entry.open_window);
+                        }
+                        debug ("open section:%s of plug: %s", entry.open_window, plug.display_name);
+                        return true;
+                    }
+
+                    return false;
+                });
+
+                if (previous_plugs.size == 0 || previous_plugs.@get (0) != plug) {
+                    previous_plugs.add (plug);
+                }
+
+                search_box.text = "";
+
+                // Launch plug's executable
+                navigation_button.label = all_settings_label;
+                navigation_button.show ();
+
+                headerbar.title = plug.display_name;
+                current_plug = plug;
+
+                // open window was set by command line argument
+                if (open_window != null) {
+                    plug.search_callback (open_window);
+                    open_window = null;
+                }
+
+                switch_to_plug (plug);
+                return false;
+            }, GLib.Priority.DEFAULT_IDLE);
+        }
+
         private void shut_down () {
             if (current_plug != null) {
                 current_plug.hidden ();
@@ -473,36 +447,6 @@ namespace Switchboard {
             }
 
             return true;
-        }
-
-        private string? gcc_to_switchboard_code_name (string gcc_name) {
-            // list of names taken from GCC's shell/cc-panel-loader.c
-            switch (gcc_name) {
-                case "background": return "pantheon-desktop";
-                case "bluetooth": return "network-pantheon-bluetooth";
-                case "color": return "hardware-gcc-color";
-                case "datetime": return "system-pantheon-datetime";
-                case "display": return "system-pantheon-display";
-                case "info": return "system-pantheon-about";
-                case "keyboard": return "hardware-pantheon-keyboard";
-                case "network": return "pantheon-network";
-                case "power": return "system-pantheon-power";
-                case "printers": return "pantheon-printers";
-                case "privacy": return "pantheon-security-privacy";
-                case "region": return "system-pantheon-locale";
-                case "sharing": return "pantheon-sharing";
-                case "sound": return "hardware-gcc-sound";
-                case "universal-access": return "pantheon-accessibility";
-                case "user-accounts": return "system-pantheon-useraccounts";
-                case "wacom": return "hardware-gcc-wacom";
-                case "notifications": return "personal-pantheon-notifications";
-
-                // not available on our system
-                case "search":
-                    return null;
-            }
-
-            return null;
         }
     }
 }
