Trigger ShowTotalAccountandContactsForState on Account(before update, before insert){
Set<ID> AccountStateSet = new Set<ID>();
for (Account A: Trigger.new){
if(A.Billing_State__c != null){
AccountStateSet.add(A.id);
}

}


Map<String,Integer> AccountCountMap = new Map<String,Integer>();
Map<String,Integer> ContactCountMap = new Map<String,Integer>();
for (AggregateResult ar : [ Select count(id), Billing_State__c from Account where Billing_State__c != null group by  Billing_State__c ]){
AccountCountMap.put((String) ar.get('Billing_State__c'), (Integer) ar.get('expr0'));

}
 for (AggregateResult ar : [Select count(id), Billing_State__c from Contact where  Billing_State__c != null group by  Billing_State__c ]){
 ContactCountMap.put((String) ar.get('Billing_State__c'), (Integer) ar.get('expr0'));
 
 }
 for (Account A: Trigger.new){
 if (A.Billing_State__c != null){
 A.No_of_Accounts_with_this_State__c = AccountCountMap.get(A.Billing_State__c);
 A.Total_no_of_Contacts_with_this_state__c = ContactCountMap.get(A.Billing_State__c);
 
 
 }
 
 }

}