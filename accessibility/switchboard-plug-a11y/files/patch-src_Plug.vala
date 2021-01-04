--- src/Plug.vala.orig	2018-12-10 20:08:18 UTC
+++ src/Plug.vala
@@ -135,7 +135,6 @@ namespace Accessibility {
             search_results.set ("%s → %s → %s".printf (display_name, _("Audio"), _("Audio descriptions")), "Audio");
             search_results.set ("%s → %s → %s".printf (display_name, _("Audio"), _("keyboard shortcut")), "Audio");
             search_results.set ("%s → %s".printf (display_name, _("Typing")), "Typing");
-            search_results.set ("%s → %s → %s".printf (display_name, _("Typing"), _("On-screen keyboard")), "Typing");
             search_results.set ("%s → %s → %s".printf (display_name, _("Typing"), _("Typing Delays")), "Typing");
             search_results.set ("%s → %s → %s".printf (display_name, _("Typing"), _("Delay between key presses (slow keys)")), "Typing");
             search_results.set ("%s → %s → %s".printf (display_name, _("Typing"), _("Beep when a key is pressed")), "Typing");
