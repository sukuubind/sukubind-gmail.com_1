public class AccountPhoneToContact{
// define variables
Map<ID,Account> OldAcctsMap;
Map<ID,Account> NewAcctsMap;
List<Account> NewAcctsList;
Set<String> Allphones = new Set<String>();
Set<ID> PhonesID = new Set<ID>();

// Create a constructor that will be expecting old and new records
public AccountPhoneToContact(Map<ID,Account> OldAcctsTriggerMap, Map<ID,Account> NewAcctsTriggerMap, List<Account> NewAcctsTriggerList){
// assign the values to the variables
OldAcctsMap = OldAcctsTriggerMap;
NewAcctsMap = NewAcctsTriggerMap;
NewAcctsList = NewAcctsTriggerList;

}
// Main Methods
public void AcctPhone(){
for (Account A : NewAcctsMap.values()){
if (A.phone != null){
Account OldAccount = OldAcctsMap.get(A.id);
String OldPhone = OldAccount.phone;
String NewPhone = A.phone;
if (NewPhone != null && NewPhone != OldPhone){
Allphones.add(A.phone);
PhonesID.add(A.ID);
}}
}
List<Account> ABCLIST = [Select id,phone,(select id,phone,accountid from Contacts) from Account where ID IN: PhonesID];
List<Contact> ChangedContact = [Select ID,Phone,Account__r.phone,Accountid from Contact where AccountID IN: PhonesID];
Map<ID,Contact> PhoneMap = new Map<ID,Contact>();
for (Contact C : ChangedContact){
PhoneMap.put(C.AccountID,C);
}
List<Contact> ContactListToUpdate = new List<Contact>();
for (Account A : ABCLIST){
if (A.phone != null){
for (Contact C : A.Contacts) {
//Contact Cont = new Contact();
C.accountid = A.id;
//Cont.accountid = Cont1.accountid;
//if(Cont1 != null) {
//Cont.accountid = Cont1.accountid;
C.phone = A.phone;

ContactListToUpdate.add(C);
}}}

update ContactListToUpdate;
}}