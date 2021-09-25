--- cli/GuestSessionToggle.vala.orig	2021-07-14 21:10:17 UTC
+++ cli/GuestSessionToggle.vala
@@ -16,9 +16,9 @@ with this program. If not, see http://www.gnu.org/lice
 
 namespace GuestSessionToggle {
 
-    const string LIGHTDM_CONF = "/etc/lightdm/lightdm.conf";
-    const string LIGHTDM_CONF_D = "/etc/lightdm/lightdm.conf.d";
-    const string GUEST_SESSION_CONF = "/usr/share/lightdm/lightdm.conf.d/60-guest-session.conf";
+    const string LIGHTDM_CONF = "%%PREFIX%%/etc/lightdm/lightdm.conf";
+    const string LIGHTDM_CONF_D = "%%PREFIX%%/etc/lightdm/lightdm.conf.d";
+    const string GUEST_SESSION_CONF = "%%PREFIX%%/share/lightdm/lightdm.conf.d/60-guest-session.conf";
 
     const OptionEntry[] OPTIONS = {
         { "show", 0, 0, OptionArg.NONE, ref show, "Show whether guest-session is enabled", null },
