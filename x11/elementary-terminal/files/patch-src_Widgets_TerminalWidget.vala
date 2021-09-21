--- src/Widgets/TerminalWidget.vala.orig	2021-07-15 21:30:31 UTC
+++ src/Widgets/TerminalWidget.vala
@@ -68,13 +68,6 @@ namespace Terminal {
         }
 
         public int default_size;
-        const string SEND_PROCESS_FINISHED_BASH = "dbus-send --type=method_call " +
-                                                  "--session --dest=io.elementary.terminal " +
-                                                  "/io/elementary/terminal " +
-                                                  "io.elementary.terminal.ProcessFinished " +
-                                                  "string:$PANTHEON_TERMINAL_ID " +
-                                                  "string:\"$(history 1 | cut -c 8-)\" " +
-                                                  "int32:\$__bp_last_ret_value >/dev/null 2>&1";
 
         /* Following strings are used to build RegEx for matching URIs */
         const string USERCHARS = "-[:alnum:]";
@@ -364,14 +357,7 @@ namespace Terminal {
 
             envv = {
                 // Export ID so we can identify the terminal for which the process completion is reported
-                "PANTHEON_TERMINAL_ID=" + terminal_id,
-
-                // Export callback command a BASH-specific variable, see "man bash" for details
-                "PROMPT_COMMAND=" + SEND_PROCESS_FINISHED_BASH + Environment.get_variable ("PROMPT_COMMAND"),
-
-                // ZSH callback command will be read from ZSH config file supplied by us, see data/
-
-                // TODO: support FISH, see https://github.com/fish-shell/fish-shell/issues/1382
+                "PANTHEON_TERMINAL_ID=" + terminal_id
             };
 
             /* We need opening uri to be available asap when constructing window with working directory
