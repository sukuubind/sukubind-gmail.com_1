Trigger CaseLimitPerUser on Case (before insert, before update){
Integer MaxCases;
//ID ABC = Userinfo.getUserid();
Case_Limit_Per_User__c  C_Settings = Case_Limit_Per_User__c.getValues('005i0000000SzvA');
if (C_Settings != null){
MaxCases = Integer.ValueOF(C_Settings.Case_Limit__c);
}
if (MaxCases != null){
Set<ID> UserSet = new Set<ID>();
Map<ID,Integer> CaseCountingMap = new Map<ID,Integer>();
for (Case NewCase : Trigger.new){
UserSet.add(NewCase.ownerid);
}
for (AggregateResult result : [select count(id), ownerid from case where ownerID IN: UserSet and CreatedDate = This_Month group by OwnerID]){
CaseCountingMap.put((ID) result.get('ownerid'), (Integer) result.get('expr0'));
}
List<User> PotentialUsers = [Select Name,ID from user where ID in: UserSet];
Map<ID,String> userMap = new Map<ID,String>();
for (User U : PotentialUsers) {
userMap.put(U.ID,U.Name);

for (Case NewCase : Trigger.new){
if (CaseCountingMap.get(NewCase.ownerid) > MaxCases){
NewCase.addError('The User has reached the limit of no. of cases for this month! The Max limit for ' + userMap.get(NewCase.ownerid) + 'is' + MaxCases);
}

}}
}}