public class UpdateRequirementHistory{
// Define variables 
Map<ID,Requirement__c> OldRequirementsMap;
Map<ID,Requirement__c> NewRequirementsMap;
List<Requirement__c> NewRequirementsList;
Set<ID> RequirementSet = new Set<ID>();
Set<ID> NewRequirementSet = new Set<ID>();


// constructor 

public UpdateRequirementHistory(Map<ID,Requirement__c> OldRequirementsTriggerMap, Map<ID,Requirement__c> NewRequirementsTriggerMap, List<Requirement__c> NewRequirementsTriggerList){
// Assign variables
OldRequirementsMap = OldRequirementsTriggerMap;
NewRequirementsMap = NewRequirementsTriggerMap;
NewRequirementsList = NewRequirementsTriggerList;

}

public void UpdateRequirement(){

for (Requirement__c R: NewRequirementsList){
if (R.Requirement_Description__c != null){
RequirementSet.add(R.ID);
}
}





List<Requirement_History__c> ReqHistListToUpdate = new List<Requirement_History__c>();

List<Requirement__c> RequirementListToIterate = [Select Requirement_Description__c,id,(Select id,Requirement__c,New_Requirement__c,Old_Requirement__c from Requirement_Historys__r ) from Requirement__c  ];

for (Requirement__c R : NewRequirementsList ){
if (R.Requirement_Description__c != null){
Requirement__c OldRequirement = OldRequirementsMap.get(R.ID);
if(OldRequirement != null) {
String OldReq = OldRequirement.Requirement_Description__c;
 String NewReq = R.Requirement_Description__c;
if (OldReq != NewReq){

Requirement_History__c RV = new Requirement_History__c();
RV.Requirement__c = R.ID;
RV.New_Requirement__c = NewReq;
RV.Old_Requirement__c = OldReq;
ReqHistListToUpdate.add(RV);

}
}
}}

Try{
Insert ReqHistListToUpdate;
}
Catch (exception e) {
System.debug(e);
}
}
}