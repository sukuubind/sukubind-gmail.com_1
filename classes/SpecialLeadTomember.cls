public class SpecialLeadTomember {
// create variable

Map<ID,Lead> OldLeadsMap;
Map<ID,Lead> NewLeadsMap;
List<Lead> NewLeadsList;
List<memberTwo__c>Members = new List<memberTwo__c>();

// Create constructor which will expect Triggeroldmap,Triggernewmap and Trigger.ne
public SpecialLeadTomember(Map<ID,Lead> OldLeadsTriggerMap,Map<ID,Lead> NewLeadsTriggerMap, List<Lead> NewLeadsTriggerList){
// assign value to the variables

OldLeadsMap = OldLeadsTriggerMap;
NewLeadsMap = NewLeadsTriggerMap;
NewLeadsList = NewLeadsTriggerList;


}
// Main Method 

public void ConvertLeadToMember() {
for (Lead L : NewLeadsList){
memberTwo__c M = new memberTwo__c();
M.Email__c = L.Email;
M.Name = L.FirstName  +  L.LastName;
Members.add(M);


}
insert Members;
//List<Lead> AList = NewLeadsList.deepclone(true);
//delete AList;
}
public List<memberTwo__c> ReturnMembers(){
return Members;
}
}