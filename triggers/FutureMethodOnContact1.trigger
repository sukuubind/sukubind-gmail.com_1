Trigger FutureMethodOnContact1 on Account (before update){
Set<ID> AccountSet = new Set<ID>();
Set<ID> ContactSet = new Set<ID>();

for (Account A : Trigger.new) {
if (A.phone != null) {
AccountSet.add(A.id);
}}

List<Contact> ContactList = [Select ID, Phone,AccountID,account.phone from Contact where Accountid IN: AccountSet];

for (Contact C: ContactList){
if (c.account.phone != null) {
ContactSet.add(C.ID);
}}

futureMethod.updateContactsLater(ContactSet);
}