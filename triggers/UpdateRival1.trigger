Trigger UpdateRival1 on Account(after update){
Set<ID> AccountSetID = new Set<ID>();
Map<ID,Integer> AccountCountMap = new Map<ID,Integer>();
List<Rival1__c> RivalList = new List<Rival1__c>();

for (Account A: Trigger.new){
if(A.Email__c != null){
AccountSetID.add(A.id);
}
}
List<Account> AccountList = [Select id,Name,Email__c,(Select ID,Name,Account__c,Email__c from Rival1s__r ) from Account where ID in: AccountSetID];
for (Account A: AccountList){
if(A.Email__c != null) {
for (Rival1__c R: A.Rival1s__r){
if(A.Email__c != R.Email__c){
R.Account__c = A.id;
R.Email__c = A.Email__c;

RivalList.add(R);
}}}
Update RivalList;
}

}