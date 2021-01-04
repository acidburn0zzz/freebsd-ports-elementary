--- src/Widgets/Categories.vala.orig	2018-12-10 20:08:18 UTC
+++ src/Widgets/Categories.vala
@@ -30,7 +30,6 @@ public class Accessibility.Categories : Gtk.ScrolledWi
 
         var display = new Panes.Display ();
         var audio = new Panes.Audio ();
-        var typing = new Panes.Typing ();
         var keyboard = new Panes.Keyboard ();
         var pointing = new Panes.Pointing ();
         var clicking = new Panes.Clicking ();
@@ -45,7 +44,6 @@ public class Accessibility.Categories : Gtk.ScrolledWi
 
         list_box.add (display);
         list_box.add (audio);
-        list_box.add (typing);
         list_box.add (keyboard);
         list_box.add (pointing);
         list_box.add (clicking);
@@ -57,8 +55,6 @@ public class Accessibility.Categories : Gtk.ScrolledWi
                 row.set_header (new Granite.HeaderLabel (_("Seeing")));
             } else if (row == audio) {
                 row.set_header (new Granite.HeaderLabel (_("Hearing")));
-            } else if (row == typing) {
-                row.set_header (new Granite.HeaderLabel (_("Interaction")));
             }
         });
 
