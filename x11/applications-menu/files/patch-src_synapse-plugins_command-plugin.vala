--- src/synapse-plugins/command-plugin.vala.orig	2019-11-25 17:07:00 UTC
+++ src/synapse-plugins/command-plugin.vala
@@ -31,15 +31,13 @@ namespace Synapse {
         private class CommandObject: Synapse.Match, ApplicationMatch {
             // for ApplicationMatch
             public AppInfo? app_info { get; set; default = null; }
-            public bool needs_terminal { get; set; default = false; }
             public string? filename { get; construct set; default = null; }
             public string command { get; construct set; }
 
             public CommandObject (string cmd) {
                 Object (title: _("Execute '%s'").printf (cmd), description: _("Run command"), command: cmd,
                         icon_name: "application-x-executable",
-                        match_type: MatchType.APPLICATION,
-                        needs_terminal: cmd.has_prefix ("sudo "));
+                        match_type: MatchType.APPLICATION);
 
                 try {
                     app_info = AppInfo.create_from_commandline (
