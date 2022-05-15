--- src/Gestures/GestureTracker.vala.orig	2022-04-07 06:54:49 UTC
+++ src/Gestures/GestureTracker.vala
@@ -100,11 +100,6 @@ public class Gala.GestureTracker : Object {
     public delegate void OnEnd (double percentage, bool cancel_action, int calculated_duration);
 
     /**
-     * Backend used if enable_touchpad is called.
-     */
-    private ToucheggBackend touchpad_backend;
-
-    /**
      * Scroll backend used if enable_scroll is called.
      */
     private ScrollBackend scroll_backend;
@@ -134,11 +129,6 @@ public class Gala.GestureTracker : Object {
      * Allow to receive touchpad multi-touch gestures.
      */
     public void enable_touchpad () {
-        touchpad_backend = ToucheggBackend.get_default ();
-        touchpad_backend.on_gesture_detected.connect (gesture_detected);
-        touchpad_backend.on_begin.connect (gesture_begin);
-        touchpad_backend.on_update.connect (gesture_update);
-        touchpad_backend.on_end.connect (gesture_end);
     }
 
     /**
