public class SpecialLeadConvert{
// Define variables
Map<ID,Lead> oldLeadMaps;
Map<ID,Lead> newLeadMaps;
List<Lead> newLeadList;
List<Member__c> MemberList = new List<Member__c>();

// Create a constructor which will accept values from the Trigger

public SpecialLeadConvert(Map<ID,Lead> OldTriggerLeadMap, Map<ID,Lead> NewTriggerLeadMap, List<Lead> NewTriggerLeadList){
// Assign values to the variables
oldLeadMaps = OldTriggerLeadMap;
newLeadMaps = NewTriggerLeadMap;
newLeadList = NewTriggerLeadList;

}

// Main Method

public void SpecialLeadConvertMainMethod() {


for (Lead L : newLeadMaps.values()){
if(L.Status == 'Member'){
Member__c  Mem = new Member__c();
Mem.Email__c = L.Email;
Mem.Name = L.firstName + '' + L.LastName;
MemberList.add(Mem);

}}
Insert MemberList;
List<Lead> workaround = newLeadList.deepClone(true);
System.debug(workaround);
}
public List<Member__c> getMembers(){
return MemberList;
}



}