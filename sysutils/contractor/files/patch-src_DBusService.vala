--- src/DBusService.vala.orig	2021-07-13 21:32:11 UTC
+++ src/DBusService.vala
@@ -147,7 +147,7 @@ namespace Contractor {
          *
          * @return an array of GenericContracts containing all contracts
          */
-        public GenericContract[] list_all_contracts () {
+        public GenericContract[] list_all_contracts () throws Error {
             var contracts = contract_source.get_contracts ();
             return convert_to_generic_contracts (contracts);
         }
