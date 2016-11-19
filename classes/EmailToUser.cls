public class EmailToUser{
// Assign variables which will accept the new and old records and values
Map<ID,Case> OldCasesMap;
Map<ID,Case> NewCasesMap;
List<Case> NewCasesList;
Set<String> AllEmails = new Set<String>();

// Create constructor which will accept old and new records as inputs
public EmailToUser(Map<ID,Case> OldCaseTriggerMap, Map<ID,Case> NewCaseTriggerMap, List<Case> NewCaseTriggerList){

// Assign the input values to variables
OldCasesMap = OldCaseTriggerMap;
NewCasesMap = NewCaseTriggerMap;
NewCasesList = NewCaseTriggerList;

}
Public void EmailToUserMethod(){
for (Case NewCase: NewCasesMap.values()){
if (NewCase.ITSM__c != null){
AllEmails.add(NewCase.ITSM__c);
}
}
List<User> PotentialUsers = [Select ID,Email,Name,phone from User where Email IN: AllEmails];
Map<String,User> EmailToUserMap = new Map<String,User>();
for (User U : PotentialUsers){
EmailToUserMap.put(U.Email,U);
}
for (Case NewCase: NewCasesMap.values()){
if (NewCase.ITSM__c != null){
User Creator = EmailToUserMap.get(NewCase.ITSM__c);
if (Creator != null){
//NewCase.CreatedByID = Creator.id;
NewCase.ownerid = Creator.ID;
NewCase.phone__c = Creator.phone;
}
}
}
}}