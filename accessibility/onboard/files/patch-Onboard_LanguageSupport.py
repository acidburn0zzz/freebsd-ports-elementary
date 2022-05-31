--- Onboard/LanguageSupport.py.orig	2017-02-15 08:42:04 UTC
+++ Onboard/LanguageSupport.py
@@ -228,7 +228,7 @@ class ISOCodes:
         self._read_countries()
 
     def _read_languages(self):
-        with open_utf8("/usr/share/xml/iso-codes/iso_639.xml") as f:
+        with open_utf8("%%PREFIX%%/share/xml/iso-codes/iso_639.xml") as f:
             dom = minidom.parse(f).documentElement
             for node in dom.getElementsByTagName("iso_639_entry"):
 
@@ -242,7 +242,7 @@ class ISOCodes:
                     self._languages[lang_code] = lang_name
 
     def _read_countries(self):
-        with open_utf8("/usr/share/xml/iso-codes/iso_3166.xml") as f:
+        with open_utf8("%%PREFIX%%/share/xml/iso-codes/iso_3166.xml") as f:
             dom = minidom.parse(f).documentElement
             for node in dom.getElementsByTagName("iso_3166_entry"):
 
