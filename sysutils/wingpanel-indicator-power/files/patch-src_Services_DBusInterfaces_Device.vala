--- src/Services/DBusInterfaces/Device.vala.orig	2021-08-23 17:38:33 UTC
+++ src/Services/DBusInterfaces/Device.vala
@@ -40,7 +40,8 @@ namespace Power.Services.DBusInterfaces {
         public abstract HistoryDataPoint[] get_history (string type, uint32 timespan, uint32 resolution) throws GLib.Error;
 
         public abstract StatisticsDataPoint[] get_statistics (string type) throws GLib.Error;
-        public abstract void refresh () throws GLib.Error;
+        // See commit, https://gitlab.freedesktop.org/upower/upower/-/commit/d0ebbe32bb5cec06335a7bd0f11f8550deaec16e
+        //public abstract void refresh () throws GLib.Error;
 
         public abstract bool has_history { public owned get; public set; }
         public abstract bool has_statistics { public owned get; public set; }
