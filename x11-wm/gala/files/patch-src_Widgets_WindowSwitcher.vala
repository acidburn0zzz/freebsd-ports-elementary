--- src/Widgets/WindowSwitcher.vala.orig	2021-11-23 20:22:23 UTC
+++ src/Widgets/WindowSwitcher.vala
@@ -24,7 +24,7 @@ namespace Gala {
         private Granite.Settings granite_settings;
         private Clutter.Canvas canvas;
         Clutter.Actor container;
-        RoundedActor indicator;
+        Clutter.Actor indicator;
         Clutter.Text caption;
 
         int modifier_mask;
@@ -43,11 +43,13 @@ namespace Gala {
         }
 
         construct {
+            var gtk_settings = Gtk.Settings.get_default ();
             granite_settings = Granite.Settings.get_default ();
 
             scaling_factor = InternalUtils.get_ui_scaling_factor ();
 
             canvas = new Clutter.Canvas ();
+            canvas.scale_factor = scaling_factor;
             set_content (canvas);
 
             // Carry out the initial draw
@@ -67,10 +69,16 @@ namespace Gala {
                 create_components ();
             });
 
+            gtk_settings.notify["gtk-theme-name"].connect (() => {
+                canvas.invalidate ();
+                create_components ();
+            });
+
             Meta.MonitorManager.@get ().monitors_changed.connect (() => {
                 var cur_scale = InternalUtils.get_ui_scaling_factor ();
                 if (cur_scale != scaling_factor) {
                     scaling_factor = cur_scale;
+                    canvas.scale_factor = scaling_factor;
                     create_components ();
                 }
             });
@@ -78,7 +86,7 @@ namespace Gala {
             canvas.draw.connect (draw);
         }
 
-        private bool draw (Cairo.Context ctx) {
+        private bool draw (Cairo.Context ctx, int width, int height) {
             ctx.save ();
 
             var widget_path = new Gtk.WidgetPath ();
@@ -86,6 +94,7 @@ namespace Gala {
             widget_path.iter_set_object_name (-1, "window");
 
             var style_context = new Gtk.StyleContext ();
+            style_context.set_scale (scaling_factor);
             style_context.set_path (widget_path);
             style_context.add_class ("background");
             style_context.add_class ("csd");
@@ -97,9 +106,8 @@ namespace Gala {
                 style_context.add_provider (css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
             }
 
-            style_context.render_background (ctx, 0, 0, (int) width, (int) height);
-            style_context.render_frame (ctx, 0, 0, (int) width, (int) height);
-
+            style_context.render_background (ctx, 0, 0, width, height);
+            style_context.render_frame (ctx, 0, 0, width, height);
             ctx.restore ();
 
             return true;
@@ -128,12 +136,31 @@ namespace Gala {
                 (uint8) (rgba.alpha * 255)
             );
 
-            indicator = new RoundedActor (accent_color, WRAPPER_BORDER_RADIUS * scaling_factor);
-
+            var rect_radius = WRAPPER_BORDER_RADIUS * scaling_factor;
+            indicator = new Clutter.Actor ();
             indicator.margin_left = indicator.margin_top =
                 indicator.margin_right = indicator.margin_bottom = 0;
             indicator.set_pivot_point (0.5f, 0.5f);
+            var indicator_canvas = new Clutter.Canvas ();
+            indicator.set_content (indicator_canvas);
+            indicator_canvas.scale_factor = scaling_factor;
+            indicator_canvas.draw.connect ((ctx, width, height) => {
+                ctx.save ();
+                ctx.set_operator (Cairo.Operator.CLEAR);
+                ctx.paint ();
+                ctx.clip ();
+                ctx.reset_clip ();
 
+                // draw rect
+                Clutter.cairo_set_source_color (ctx, accent_color);
+                Granite.Drawing.Utilities.cairo_rounded_rectangle (ctx, 0, 0, width, height, rect_radius);
+                ctx.set_operator (Cairo.Operator.SOURCE);
+                ctx.fill ();
+
+                ctx.restore ();
+                return true;
+            });
+
             var caption_color = "#2e2e31";
 
             if (granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK) {
@@ -229,10 +256,9 @@ namespace Gala {
             l.column_spacing = l.row_spacing = WRAPPER_PADDING * scaling_factor;
 
             indicator.visible = false;
-            indicator.resize (
-                (ICON_SIZE + WRAPPER_PADDING * 2) * scaling_factor,
-                (ICON_SIZE + WRAPPER_PADDING * 2) * scaling_factor
-            );
+            var indicator_size = (ICON_SIZE + WRAPPER_PADDING * 2) * scaling_factor;
+            indicator.set_size (indicator_size, indicator_size);
+            ((Clutter.Canvas) indicator.content).set_size (indicator_size, indicator_size);
             caption.visible = false;
             caption.margin_bottom = caption.margin_top = WRAPPER_PADDING * scaling_factor;
 
@@ -268,8 +294,9 @@ namespace Gala {
 
             opacity = 0;
 
-            set_size ((int) nat_width, (int) (nat_height + caption_height / 2 - container.margin_bottom + WRAPPER_PADDING * 3 * scaling_factor));
-            canvas.set_size ((int) nat_width, (int) (nat_height + caption_height / 2 - container.margin_bottom + WRAPPER_PADDING * 3 * scaling_factor));
+            var switcher_height = (int) (nat_height + caption_height / 2 - container.margin_bottom + WRAPPER_PADDING * 3 * scaling_factor);
+            set_size ((int) nat_width, switcher_height);
+            canvas.set_size ((int) nat_width, switcher_height);
             canvas.invalidate ();
 
             set_position (
@@ -277,11 +304,35 @@ namespace Gala {
                 (int) (geom.y + (geom.height - height) / 2)
             );
 
+            toggle_display (true);
+
+            // if we did not have the grab before the key was released, close immediately
+            if ((get_current_modifiers () & modifier_mask) == 0) {
+                close_switcher (wm.get_display ().get_current_time ());
+            }
+        }
+
+        void toggle_display (bool show) {
+            if (opened == show) {
+                return;
+            }
+
+            opened = show;
+            if (show) {
+                push_modal ();
+            } else {
+                wm.pop_modal (modal_proxy);
+            }
+
             save_easing_state ();
             set_easing_duration (200);
-            opacity = 255;
+            opacity = show ? 255 : 0;
             restore_easing_state ();
 
+            container.reactive = show;
+        }
+
+        void push_modal () {
             modal_proxy = wm.push_modal ();
             modal_proxy.keybinding_filter = (binding) => {
                 // if it's not built-in, we can block it right away
@@ -295,14 +346,7 @@ namespace Gala {
                     || name == "switch-windows" || name == "switch-windows-backward");
             };
 
-            opened = true;
-
             grab_key_focus ();
-
-            // if we did not have the grab before the key was released, close immediately
-            if ((get_current_modifiers () & modifier_mask) == 0) {
-                close_switcher (wm.get_display ().get_current_time ());
-            }
         }
 
         void close_switcher (uint32 time, bool cancel = false) {
@@ -310,9 +354,6 @@ namespace Gala {
                 return;
             }
 
-            wm.pop_modal (modal_proxy);
-            opened = false;
-
             var window = cur_icon.window;
             if (window == null) {
                 return;
@@ -327,10 +368,7 @@ namespace Gala {
                 }
             }
 
-            save_easing_state ();
-            set_easing_duration (100);
-            opacity = 0;
-            restore_easing_state ();
+            toggle_display (false);
         }
 
         void next_window (Meta.Display display, Meta.Workspace? workspace, bool backward) {
