public  class ApplicationRecievedDateOnAccountAll{
Map<ID,Opportunity> OldOppMaps;
Map<ID,Opportunity> NewOppMaps;
List<Opportunity> NewOppList;

public ApplicationRecievedDateOnAccountAll(Map<ID,Opportunity> OldOppTriggerMap, Map<ID,Opportunity> NewOppTriggerMap,List<Opportunity> NewOppTriggerList){
OldOppMaps = OldOppTriggerMap;
NewOppMaps = NewOppTriggerMap;
NewOppList = NewOppTriggerList;
}

Public void AppRecd(){
Set<ID> OppIDSet = new Set<ID>();

for (Opportunity O : NewOppList){
if  (O.Application_Received_Date__c == null || O.Start_Date__c == null || O.Birthdate__c == null )  {
OppIDSet.add(O.Contact__c);
}

}
List<Contact> ContactToUpdate = new List<Contact>();
//List<Contact> ContactList = [Select ID,Name from Contact where Birthdate = null and ID IN: OppIDSet ];
//Map<ID,Contact> ContactMap = new Map <ID,Contact>();
//for (Contact  C : ContactList){
//ContactMap.put(C.ID,C);
//}
Account_Custom_Setting__c ACS  = Account_Custom_Setting__c.getInstance('Lake Elmo') ;
String AccountName = ACS.Account_Name__c;
M_Custom_Setting__c MCS = M_Custom_Setting__c.getInstance('CDA-KU');
String ProgramName = MCS.Program_Name__c;

Set<Opportunity> OpptSet = new Set<Opportunity>();
for (Opportunity O : NewOppList){
if (O.Accountid == AccountName && O.Academic_Program__c == ProgramName){
O.StageName = 'Application';
//O.OwnerID = '005500000025Na2';
if ( O.Application_Received_Date__c == null ){

O.Application_Received_Date__c = Date.today();

}
if (O.Start_Date__c == null){
if(O.LP_INTLEAD__c != null){
date mydate = Date.valueOf(O.LP_INTLEAD__c);  

if(mydate != null){
O.Start_Date__c = mydate;
}}}

if (O.Birthdate__c == null){
//Contact Con = ContactMap.get(O.Contact__c);
//if(Con != null) {
Contact Cont = new Contact();
Cont.ID = O.Contact__c;
Cont.Birthdate = date.Valueof('1900-01-01');

ContactToUpdate.add(Cont);
//if(O.StageName != 'Completed Enrollment Agreement') {
//O.StageName = 'Completed Enrollment Agreement';
//}
//}

}}}

update ContactToUpdate;
}
}