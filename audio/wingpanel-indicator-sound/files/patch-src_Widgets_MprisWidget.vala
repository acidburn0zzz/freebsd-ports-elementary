--- src/Widgets/MprisWidget.vala.orig	2020-10-08 18:18:59 UTC
+++ src/Widgets/MprisWidget.vala
@@ -71,6 +71,8 @@ public class Sound.Widgets.MprisWidget : Gtk.Box {
     public void update_default_player () {
         var new_player = AppInfo.get_default_for_type ("audio/x-vorbis+ogg", false);
         if (new_player != null && (new_player != default_player)) {
+                default_player = new_player;
+
             if (default_widget != null) {
                 default_widget.destroy ();
             }
