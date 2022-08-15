--- update.c.orig	2013-01-21 13:50:11 UTC
+++ update.c
@@ -48,12 +48,40 @@ has_xdg_translation (void)
   if (strncmp (locale, "en_US", 5) == 0 ||
       strcmp (locale, "C") == 0)
     return TRUE;
-  
+
   str = "Desktop";
   return dgettext ("xdg-user-dirs", str) != str;
 }
 
 static void
+save_locale (void)
+{
+  FILE *file;
+  char *user_locale_file;
+  char *locale, *dot;
+
+  user_locale_file = g_build_filename (g_get_user_config_dir (),
+                                       "user-dirs.locale", NULL);
+  file = fopen (user_locale_file, "w");
+  g_free (user_locale_file);
+
+  if (file == NULL)
+    {
+      fprintf (stderr, "Can't save user-dirs.locale\n");
+      return;
+    }
+
+  locale = g_strdup (setlocale (LC_MESSAGES, NULL));
+  /* Skip encoding part */
+  dot = strchr (locale, '.');
+  if (dot)
+    *dot = 0;
+  fprintf (file, "%s", locale);
+  g_free (locale);
+  fclose (file);
+}
+
+static void
 update_locale (XdgDirEntry *old_entries)
 {
   XdgDirEntry *new_entries, *entry;
@@ -91,10 +119,9 @@ update_locale (XdgDirEntry *old_entries)
   g_free (std_out);
   g_free (std_err);
   g_free (cmdline);
-
   if (!WIFEXITED(exit_status) || WEXITSTATUS(exit_status) != 0)
     return;
-  
+
   new_entries = parse_xdg_dirs (filename);
   g_unlink (filename);
   g_free (filename);
@@ -254,12 +281,7 @@ update_locale (XdgDirEntry *old_entries)
 
   if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (check)))
     {
-      char *file;
-      
-      file = g_build_filename (g_get_user_config_dir (),
-			       "user-dirs.locale", NULL);
-      g_unlink (file);
-      g_free (file);
+      save_locale ();
     }
 
   g_free (new_entries);
