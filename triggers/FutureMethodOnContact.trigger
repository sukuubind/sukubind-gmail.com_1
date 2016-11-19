Trigger FutureMethodOnContact on Contact (before update){
Set<ID> ContactIDSet = new Set<ID>();
for (Contact C: Trigger.new) {
if(C.account.phone != null) {
Contact OldContact = Trigger.oldMap.get(C.id);
String OldPhone = OldContact.account.phone;
String NewPhone = c.account.phone;
if (NewPhone != null && NewPhone != OldPhone) {
ContactIDSet.add(C.ID);
}}}


futureMethod.updateContactsLater(ContactIDSet);
}