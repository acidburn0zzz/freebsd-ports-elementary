--- src/Indicator.vala.orig	2020-04-01 23:50:50 UTC
+++ src/Indicator.vala
@@ -23,7 +23,8 @@ public class Session.Indicator : Wingpanel.Indicator {
 
     private SystemInterface suspend_interface;
     private LockInterface lock_interface;
-    private SeatInterface seat_interface;
+    private SessionInterface session_interface;
+    private SystemInterface system_interface;
 
     private Wingpanel.IndicatorManager.ServerType server_type;
     private Wingpanel.Widgets.OverlayIcon indicator_icon;
@@ -39,9 +40,7 @@ public class Session.Indicator : Wingpanel.Indicator {
     private static GLib.Settings? keybinding_settings;
 
     public Indicator (Wingpanel.IndicatorManager.ServerType server_type) {
-        Object (code_name: Wingpanel.Indicator.SESSION,
-                display_name: _("Session"),
-                description: _("The session indicator"));
+        Object (code_name: Wingpanel.Indicator.SESSION);
         this.server_type = server_type;
         this.visible = true;
 
@@ -60,8 +59,12 @@ public class Session.Indicator : Wingpanel.Indicator {
             indicator_icon = new Wingpanel.Widgets.OverlayIcon (ICON_NAME);
             indicator_icon.button_press_event.connect ((e) => {
                 if (e.button == Gdk.BUTTON_MIDDLE) {
-                    close ();
-                    show_dialog (Widgets.EndSessionDialogType.RESTART);
+                    if (session_interface == null) {
+                        init_interfaces ();
+                    }
+
+                    show_shutdown_dialog ();
+
                     return Gdk.EVENT_STOP;
                 }
 
@@ -124,8 +127,31 @@ public class Session.Indicator : Wingpanel.Indicator {
             main_grid.add (shutdown);
 
             if (keybinding_settings != null) {
-                keybinding_settings.bind ("logout", log_out_grid, "accel-string", GLib.SettingsBindFlags.GET);
-                keybinding_settings.bind ("screensaver", lock_screen_grid, "accel-string", GLib.SettingsBindFlags.GET);
+                // This key type has changed in recent versions of GNOME Settings Daemon
+                unowned VariantType key_type = keybinding_settings.get_value ("logout").get_type ();
+                if (key_type.equal (VariantType.STRING)) {
+                    log_out_grid.accel_string = keybinding_settings.get_string ("logout");
+                    lock_screen_grid.accel_string = keybinding_settings.get_string ("screensaver");
+
+                    keybinding_settings.changed["logout"].connect (() => {
+                        log_out_grid.accel_string = keybinding_settings.get_string ("logout");
+                    });
+
+                    keybinding_settings.changed["screensaver"].connect (() => {
+                        lock_screen_grid.accel_string = keybinding_settings.get_string ("screensaver");
+                    });
+                } else if (key_type.equal (VariantType.STRING_ARRAY)) {
+                    log_out_grid.accel_string = keybinding_settings.get_strv ("logout")[0];
+                    lock_screen_grid.accel_string = keybinding_settings.get_strv ("screensaver")[0];
+
+                    keybinding_settings.changed["logout"].connect (() => {
+                        log_out_grid.accel_string = keybinding_settings.get_strv ("logout")[0];
+                    });
+
+                    keybinding_settings.changed["screensaver"].connect (() => {
+                        lock_screen_grid.accel_string = keybinding_settings.get_strv ("screensaver")[0];
+                    });
+                }
             }
 
             manager.close.connect (() => close ());
@@ -140,7 +166,9 @@ public class Session.Indicator : Wingpanel.Indicator {
                 }
             });
 
-            shutdown.clicked.connect (() => show_dialog (Widgets.EndSessionDialogType.RESTART));
+            shutdown.clicked.connect (() => {
+                show_shutdown_dialog ();
+            });
 
             suspend.clicked.connect (() => {
                 close ();
@@ -152,7 +180,17 @@ public class Session.Indicator : Wingpanel.Indicator {
                 }
             });
 
-            log_out.clicked.connect (() => show_dialog (Widgets.EndSessionDialogType.LOGOUT));
+            log_out.clicked.connect (() => {
+                session_interface.logout.begin (0, (obj, res) => {
+                    try {
+                        session_interface.logout.end (res);
+                    } catch (Error e) {
+                        if (!(e is GLib.IOError.CANCELLED)) {
+                            warning ("Unable to open logout dialog: %s", e.message);
+                        }
+                    }
+                });
+            });
 
             lock_screen.clicked.connect (() => {
                 close ();
@@ -168,9 +206,31 @@ public class Session.Indicator : Wingpanel.Indicator {
         return main_grid;
     }
 
+    private void show_shutdown_dialog () {
+        close ();
+
+        if (server_type == Wingpanel.IndicatorManager.ServerType.SESSION) {
+            // Ask gnome-session to "reboot" which throws the EndSessionDialog
+            // Our "reboot" dialog also has a shutdown button to give the choice between reboot/shutdown
+            session_interface.reboot.begin ((obj, res) => {
+                try {
+                    session_interface.reboot.end (res);
+                } catch (Error e) {
+                    if (!(e is GLib.IOError.CANCELLED)) {
+                        critical ("Unable to open shutdown dialog: %s", e.message);
+                    }
+                }
+            });
+        } else {
+            show_dialog (Widgets.EndSessionDialogType.RESTART);
+        }
+    }
+
     private void init_interfaces () {
         try {
-            suspend_interface = Bus.get_proxy_sync (BusType.SYSTEM, "org.freedesktop.login1", "/org/freedesktop/login1");
+            suspend_interface = Bus.get_proxy_sync (BusType.SYSTEM,
+                                                    "org.freedesktop.ConsoleKit",
+                                                    "/org/freedesktop/ConsoleKit/Manager");
         } catch (IOError e) {
             warning ("Unable to connect to suspend interface: %s", e.message);
             suspend.set_sensitive (false);
@@ -178,18 +238,25 @@ public class Session.Indicator : Wingpanel.Indicator {
 
         if (server_type == Wingpanel.IndicatorManager.ServerType.SESSION) {
             try {
-                lock_interface = Bus.get_proxy_sync (BusType.SESSION, "org.freedesktop.ScreenSaver", "/org/freedesktop/ScreenSaver");
+                lock_interface = Bus.get_proxy_sync (BusType.SESSION, "org.gnome.ScreenSaver", "/org/gnome/ScreenSaver");
             } catch (IOError e) {
                 warning ("Unable to connect to lock interface: %s", e.message);
                 lock_screen.set_sensitive (false);
             }
 
             try {
-                seat_interface = Bus.get_proxy_sync (BusType.SESSION, "org.freedesktop.DisplayManager", "/org/freedesktop/DisplayManager/Seat0");
+                session_interface = Bus.get_proxy_sync (BusType.SESSION, "org.gnome.SessionManager", "/org/gnome/SessionManager");
             } catch (IOError e) {
-                warning ("Unable to connect to seat interface: %s", e.message);
-                lock_screen.set_sensitive (false);
+                critical ("Unable to connect to GNOME session interface: %s", e.message);
             }
+        } else {
+            try {
+                system_interface = Bus.get_proxy_sync (BusType.SYSTEM,
+                                                       "org.freedesktop.ConsoleKit",
+                                                       "/org/freedesktop/ConsoleKit/Manager");
+            } catch (IOError e) {
+                critical ("Unable to connect to the ConsoleKit2 interface: %s", e.message);
+            }
         }
     }
 
@@ -214,8 +281,46 @@ public class Session.Indicator : Wingpanel.Indicator {
             }
         }
 
+        unowned EndSessionDialogServer server = EndSessionDialogServer.get_default ();
+
         current_dialog = new Widgets.EndSessionDialog (type);
-        current_dialog.destroy.connect (() => current_dialog = null);
+        current_dialog.destroy.connect (() => {
+            server.closed ();
+            current_dialog = null;
+        });
+
+        current_dialog.cancelled.connect (() => {
+            server.canceled ();
+        });
+
+        current_dialog.logout.connect (() => {
+            server.confirmed_logout ();
+        });
+
+        current_dialog.shutdown.connect (() => {
+            if (server_type == Wingpanel.IndicatorManager.ServerType.SESSION) {
+                server.confirmed_shutdown ();
+            } else {
+                try {
+                    system_interface.power_off (false);
+                } catch (Error e) {
+                    warning ("Unable to shutdown: %s", e.message);
+                }
+            }
+        });
+
+        current_dialog.reboot.connect (() => {
+            if (server_type == Wingpanel.IndicatorManager.ServerType.SESSION) {
+                server.confirmed_reboot ();
+            } else {
+                try {
+                    system_interface.reboot (false);
+                } catch (Error e) {
+                    warning ("Unable to reboot: %s", e.message);
+                }
+            }
+        });
+
         current_dialog.set_transient_for (indicator_icon.get_toplevel () as Gtk.Window);
         current_dialog.show_all ();
     }
