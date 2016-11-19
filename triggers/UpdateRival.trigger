Trigger UpdateRival on Account (before update, before insert){
for (Account A : Trigger.new){
if (A.Rival_picklist__c != null){
Rival__c R = [Select id,Name from Rival__c where Name = : A.Rival_picklist__c];
if (R != null){
A.Rival__c = R.id;
}

}
}

}