--- src/Plug.vala.orig	2021-07-14 21:10:17 UTC
+++ src/Plug.vala
@@ -149,7 +149,6 @@ namespace SwitchboardPlugUserAccounts {
             search_results.set ("%s → %s".printf (display_name, _("Language")), "");
             search_results.set ("%s → %s".printf (display_name, _("Log in automatically")), "");
             search_results.set ("%s → %s".printf (display_name, _("Change Password")), "");
-            search_results.set ("%s → %s".printf (display_name, _("Guest Session")), "");
             return search_results;
         }
     }
