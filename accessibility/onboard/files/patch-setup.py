--- setup.py.orig	2017-02-16 21:46:10 UTC
+++ setup.py
@@ -129,7 +129,7 @@ def clean_before_build(command):
     if command in ["build", "build_ext", "clean", "sdist"]:
         print("removing __pycache__ directories recursively")
         subprocess.check_call(
-         ['/bin/bash', '-c', "find . -name '__pycache__*' -prune | xargs rm -rf"])
+         ['/bin/sh', '-c', "find . -name '__pycache__*' -prune | xargs rm -rf"])
 
     # Symlinked extension libraries trip up "setup.py sdist". Delete them.
     if command in ["clean", "sdist"]:
@@ -357,7 +357,7 @@ class build_i18n_custom(DistUtilsExtra.auto.build_i18n
         for i, file_set in enumerate(self.distribution.data_files):
             target, files = file_set
             if target == 'share/autostart':
-                file_set = ('/etc/xdg/autostart', files)
+                file_set = ('etc/xdg/autostart', files)
                 self.distribution.data_files[i] = file_set
 
 
@@ -394,11 +394,10 @@ DistUtilsExtra.auto.setup(
 
     packages = ['Onboard', 'Onboard.pypredict'],
 
-    data_files = [('share/glib-2.0/schemas', glob.glob('data/*.gschema.xml')),
+    data_files = [('share/glib-2.0/schemas', glob.glob('data/org.onboard.gschema.xml')),
                   ('share/dbus-1/services', glob.glob('data/org.onboard.Onboard.service')),
                   ('share/onboard', glob.glob('AUTHORS')),
                   ('share/onboard', glob.glob('CHANGELOG')),
-                  ('share/onboard', glob.glob('COPYING*')),
                   ('share/onboard', glob.glob('HACKING')),
                   ('share/onboard', glob.glob('NEWS')),
                   ('share/onboard', glob.glob('README')),
@@ -413,7 +412,7 @@ DistUtilsExtra.auto.setup(
                   ('share/icons/HighContrast/scalable/apps', glob.glob('icons/HighContrast/*')),
                   ('share/icons/ubuntu-mono-dark/status/22', glob.glob('icons/ubuntu-mono-dark/*')),
                   ('share/icons/ubuntu-mono-light/status/22', glob.glob('icons/ubuntu-mono-light/*')),
-                  ('share/man/man1', glob.glob('man/*')),
+                  ('man/man1', glob.glob('man/*')),
                   ('share/sounds/freedesktop/stereo', glob.glob('sounds/*')),
                   ('share/onboard/layouts', glob.glob('layouts/*.*')),
                   ('share/onboard/layouts/images', glob.glob('layouts/images/*')),
@@ -421,11 +420,6 @@ DistUtilsExtra.auto.setup(
                   ('share/onboard/scripts', glob.glob('scripts/*')),
                   ('share/onboard/models', glob.glob('models/*.lm')),
                   ('share/onboard/tools', glob.glob('Onboard/pypredict/tools/checkmodels')),
-
-                  ('share/gnome-shell/extensions/Onboard_Indicator@onboard.org',
-                      glob_files('gnome/Onboard_Indicator@onboard.org/*')),
-                  ('share/gnome-shell/extensions/Onboard_Indicator@onboard.org/schemas',
-                      glob_files('gnome/Onboard_Indicator@onboard.org/schemas/*')),
                  ],
 
     scripts = ['onboard', 'onboard-settings'],
