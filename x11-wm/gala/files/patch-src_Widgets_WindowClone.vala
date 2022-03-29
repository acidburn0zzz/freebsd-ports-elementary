--- src/Widgets/WindowClone.vala.orig	2021-11-23 20:22:23 UTC
+++ src/Widgets/WindowClone.vala
@@ -409,10 +409,16 @@ namespace Gala {
                 window_icon.opacity = 0;
                 set_window_icon_position (outer_rect.width, outer_rect.height);
 
-                window_icon.get_transition ("opacity").completed.connect (() => {
+                var transition = window_icon.get_transition ("opacity");
+                if (transition != null) {
+                    transition.completed.connect (() => {
+                        in_slot_animation = false;
+                        place_widgets (outer_rect.width, outer_rect.height);
+                    });
+                } else {
                     in_slot_animation = false;
                     place_widgets (outer_rect.width, outer_rect.height);
-                });
+                }
             };
 
             if (!animate || gesture_tracker == null || !with_gesture) {
