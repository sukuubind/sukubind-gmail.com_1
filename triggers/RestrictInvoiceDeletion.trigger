trigger RestrictInvoiceDeletion on Invoice__c (before delete) {
// With each of the invoice statements targeted by the trigger
// and that have line items, add an error to prevent them
// from being deleted.
for (Invoice__c inv :
[SELECT Id
FROM Invoice__c
WHERE Id IN (SELECT Invoice__c FROM Line_Item__c) AND
Id IN :Trigger.old]){
Trigger.oldMap.get(inv.Id).addError(
'Cannot delete invoice statement with line items');
}
}