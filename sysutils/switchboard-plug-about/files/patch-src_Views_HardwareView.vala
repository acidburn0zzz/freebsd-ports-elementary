--- src/Views/HardwareView.vala.orig	2021-08-24 20:34:26 UTC
+++ src/Views/HardwareView.vala
@@ -22,19 +22,12 @@
 
 public class About.HardwareView : Gtk.Grid {
     private bool oem_enabled;
-    private string manufacturer_icon_path;
-    private string manufacturer_name;
-    private string manufacturer_support_url;
     private string memory;
     private string processor;
     private string product_name;
     private string product_version;
-    private SystemInterface system_interface;
     private SessionManager? session_manager;
-    private SwitcherooControl? switcheroo_interface;
 
-    private Gtk.Image manufacturer_logo;
-
     private Gtk.Label primary_graphics_info;
     private Gtk.Label secondary_graphics_info;
     private Gtk.Grid graphics_grid;
@@ -94,81 +87,22 @@ public class About.HardwareView : Gtk.Grid {
             row_spacing = 6
         };
 
-        manufacturer_logo = new Gtk.Image () {
-            halign = Gtk.Align.END,
-            pixel_size = 128,
-            use_fallback = true
-        };
+        details_grid.add (product_name_info);
 
-        if (oem_enabled) {
-            var fileicon = new FileIcon (File.new_for_path (manufacturer_icon_path));
-
-            if (manufacturer_icon_path != null) {
-                manufacturer_logo.gicon = fileicon;
-            }
-
-            if (product_name != null) {
-                product_name_info.label = "<b>%s</b>".printf (product_name);
-                product_name_info.use_markup = true;
-            }
-
-            if (product_version != null) {
-                 product_name_info.label += " %s".printf (product_version);
-            }
-
-            var manufacturer_info = new Gtk.Label (manufacturer_name) {
-                ellipsize = Pango.EllipsizeMode.MIDDLE,
-                selectable = true,
-                xalign = 0
-            };
-            manufacturer_info.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);
-
-            details_grid.add (product_name_info);
-            details_grid.add (manufacturer_info);
-        } else {
-            details_grid.add (product_name_info);
-        }
-
-        if (manufacturer_logo.gicon == null) {
-            load_fallback_manufacturer_icon.begin ();
-        }
-
         details_grid.add (processor_info);
         details_grid.add (graphics_grid);
 
         details_grid.add (memory_info);
         details_grid.add (storage_info);
 
-        if (oem_enabled && manufacturer_support_url != null) {
-            var manufacturer_website_info = new Gtk.LinkButton.with_label (
-                manufacturer_support_url,
-                _("Manufacturer Website")
-            ) {
-                halign = Gtk.Align.START,
-                margin_top = 12,
-                xalign = 0
-            };
-
-            details_grid.add (manufacturer_website_info);
-        }
-
         margin_left = 16;
         margin_right = 16;
         column_spacing = 32;
         halign = Gtk.Align.CENTER;
 
-        add (manufacturer_logo);
         add (details_grid);
     }
 
-    private async void load_fallback_manufacturer_icon () {
-        get_system_interface_instance ();
-
-        if (system_interface != null) {
-            manufacturer_logo.icon_name = system_interface.icon_name;
-        }
-    }
-
     private string? try_get_arm_model (GLib.HashTable<string, string> values) {
         string? cpu_implementer = values.lookup ("CPU implementer");
         string? cpu_part = values.lookup ("CPU part");
@@ -258,52 +192,16 @@ public class About.HardwareView : Gtk.Grid {
             }
         }
 
-        if (switcheroo_interface == null) {
-            try {
-                switcheroo_interface = yield Bus.get_proxy (
-                    BusType.SYSTEM,
-                    "net.hadess.SwitcherooControl",
-                    "/net/hadess/SwitcherooControl"
-                );
-            } catch (Error e) {
-                warning ("Unable to connect to switcheroo-control: %s", e.message);
-            }
-        }
-
         string? gpu_name = null;
 
         const string[] FALLBACKS = {
             "Intel Corporation"
         };
 
-        if (switcheroo_interface != null) {
-            if (!primary && !switcheroo_interface.has_dual_gpu) {
-                return null;
-            }
-
-            foreach (unowned HashTable<string,Variant> gpu in switcheroo_interface.gpus) {
-                bool is_default = gpu.get ("Default").get_boolean ();
-
-                if (is_default == primary) {
-                    unowned string candidate = gpu.get ("Name").get_string ();
-                    if (candidate in FALLBACKS) {
-                        continue;
-                    }
-                    gpu_name = clean_name (candidate);
-                }
-            }
-        }
-
         if (gpu_name != null) {
             return gpu_name;
         }
 
-        // Switcheroo failed to get the name of the secondary GPU, we'll assume there isn't one
-        // and return null
-        if (!primary) {
-            return null;
-        }
-
         if (session_manager != null) {
             return clean_name (session_manager.renderer);
         }
@@ -339,34 +237,7 @@ public class About.HardwareView : Gtk.Grid {
         get_graphics_info.begin ();
         get_storage_info.begin ();
 
-        try {
-            var oem_file = new KeyFile ();
-            oem_file.load_from_file ("/etc/oem.conf", KeyFileFlags.NONE);
-            // Assume we get the manufacturer name
-            manufacturer_name = oem_file.get_string ("OEM", "Manufacturer");
-
-            // We need to check if the key is here because get_string throws an error if the key isn't available.
-            if (oem_file.has_key ("OEM", "Product")) {
-                product_name = oem_file.get_string ("OEM", "Product");
-            }
-
-            if (oem_file.has_key ("OEM", "Version")) {
-                product_version = oem_file.get_string ("OEM", "Version");
-            }
-
-            if (oem_file.has_key ("OEM", "Logo")) {
-                manufacturer_icon_path = oem_file.get_string ("OEM", "Logo");
-            }
-
-            if (oem_file.has_key ("OEM", "URL")) {
-                manufacturer_support_url = oem_file.get_string ("OEM", "URL");
-            }
-
-            oem_enabled = true;
-        } catch (Error e) {
-            debug (e.message);
-            oem_enabled = false;
-        }
+        oem_enabled = false;
     }
 
     private async void get_storage_info () {
@@ -413,32 +284,10 @@ public class About.HardwareView : Gtk.Grid {
     }
 
     private async string get_storage_type (string storage_capacity) {
-        string partition_name = yield get_partition_name ();
-        string disk_name = yield get_disk_name (partition_name);
-        string path = "/sys/block/%s/queue/rotational".printf (disk_name);
         string storage = "";
-        try {
-            var file = File.new_for_path (path);
-            var dis = new DataInputStream (yield file.read_async ());
-            // Only a single line in this "file"
-            string contents = yield dis.read_line_async ();
 
-            if (int.parse (contents) == 0) {
-                if (disk_name.has_prefix ("nvme")) {
-                    storage = _("%s storage (NVMe SSD)").printf (storage_capacity);
-                } else if (disk_name.has_prefix ("mmc")) {
-                    storage = _("%s storage (eMMC)").printf (storage_capacity);
-                } else {
-                    storage = _("%s storage (SATA SSD)").printf (storage_capacity);
-                }
-            } else {
-                storage = _("%s storage (HDD)").printf (storage_capacity);
-            }
-        } catch (Error e) {
-            warning (e.message);
-            // Set fallback string for the device type
-            storage = _("%s storage").printf (storage_capacity);
-        }
+        // Set fallback string for the device type
+        storage = _("%s storage").printf (storage_capacity);
         return storage;
     }
 
@@ -483,57 +332,13 @@ public class About.HardwareView : Gtk.Grid {
         string replacement;
     }
 
-    private void get_system_interface_instance () {
-        if (system_interface == null) {
-            try {
-                system_interface = Bus.get_proxy_sync (
-                    BusType.SYSTEM,
-                    "org.freedesktop.hostname1",
-                    "/org/freedesktop/hostname1"
-                );
-            } catch (GLib.Error e) {
-                warning ("%s", e.message);
-            }
-        }
-    }
-
     private string get_host_name () {
-        get_system_interface_instance ();
-
-        if (system_interface == null) {
-            return GLib.Environment.get_host_name ();
-        }
-
-        string hostname = system_interface.pretty_hostname;
-
-        if (hostname.length == 0) {
-            hostname = system_interface.static_hostname;
-        }
-
-        return hostname;
+        return GLib.Environment.get_host_name ();
     }
 }
 
-[DBus (name = "org.freedesktop.hostname1")]
-public interface SystemInterface : Object {
-    [DBus (name = "IconName")]
-    public abstract string icon_name { owned get; }
-
-    public abstract string pretty_hostname { owned get; }
-    public abstract string static_hostname { owned get; }
-}
-
 [DBus (name = "org.gnome.SessionManager")]
 public interface SessionManager : Object {
     [DBus (name = "Renderer")]
     public abstract string renderer { owned get;}
-}
-
-[DBus (name = "net.hadess.SwitcherooControl")]
-public interface SwitcherooControl : Object {
-    [DBus (name = "HasDualGpu")]
-    public abstract bool has_dual_gpu { owned get; }
-
-    [DBus (name = "GPUs")]
-    public abstract HashTable<string,Variant>[] gpus { owned get; }
 }
