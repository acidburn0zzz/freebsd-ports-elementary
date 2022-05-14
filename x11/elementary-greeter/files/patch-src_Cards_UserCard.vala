--- src/Cards/UserCard.vala.orig	2022-05-10 16:52:42 UTC
+++ src/Cards/UserCard.vala
@@ -203,10 +203,12 @@ public class Greeter.UserCard : Greeter.BaseCard {
 
         update_collapsed_class ();
 
-        var avatar = new Hdy.Avatar (64, lightdm_user.display_name, true) {
+        var avatar = new Hdy.Avatar (64, lightdm_user.display_name, false) {
             margin = 6
         };
-        avatar.loadable_icon = new FileIcon (File.new_for_path (lightdm_user.image));
+        if (lightdm_user.image != null) {
+            avatar.loadable_icon = new FileIcon (File.new_for_path (lightdm_user.image));
+        }
 
         var avatar_overlay = new Gtk.Overlay () {
             halign = Gtk.Align.CENTER,
