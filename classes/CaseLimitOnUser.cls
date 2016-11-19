public class CaseLimitOnUser{
// create variable that will store the Trigger.oldmap, Trigger.newmap, Trigger.newmap
Map<ID,Case> OldCasesMap;
Map<ID,Case> NewCasesMap;
List<Case> NewCasesList;
Integer MaxCases;
Set<ID>UserIDSet = new Set<ID>();
Map<ID,Integer> CaseCountMap = new Map<ID,Integer>();
Map<ID,User> UserNameMap = new Map<ID,User>();

// create a constructor to expect the new and old values from the trigger

public CaseLimitOnUser(Map<ID,Case> OldCasesTriggerMap, Map<ID,Case> NewCasesTriggerMap, List<Case> NewCasesTriggerList){
// Assign values to the variables

OldCasesMap = OldCasesTriggerMap;
NewCasesMap = NewCasesTriggerMap;
NewCasesList = NewCasesTriggerList;
}
// Main Methods

public void CaseLimit(){
String UName = UserInfo.getName();
String Prof = [Select id,name from User where Name =: UName].name;
Limit_On_Cases__c settings = Limit_On_Cases__c.getValues(UName);
MaxCases = Integer.valueOf(settings.Case_Limit__c);

for (Case NewCase : NewCasesList){

UserIDSet.add(NewCase.ownerid);

}
List<User> PotentialUser = [Select ID,Name from User where ID IN: UserIDSet];
for (User U : PotentialUser){
UserNameMap.put(U.ID,U);
}


for (AggregateResult result : [Select count(id), ownerid from Case where ownerid IN: UserIDSet and CreatedDate = This_Month group by ownerid]){
CaseCountMap.put((id) result.get('ownerid'), (Integer) result.get('expr0'));
}

for (Case NewCase : NewCasesList){
if (MaxCases < CaseCountMap.get(NewCase.ownerid)){
NewCase.addError('The maximum cases allowed ' + CaseCountMap.get(NewCase.ownerid) + 'for User ' + UserNameMap.get(NewCase.ownerid).name + 'have reached, no new case for today can be created' );
}

}

}



}