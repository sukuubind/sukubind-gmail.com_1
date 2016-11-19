public class SpecialLeadConverToMemberOne{
// Define the variables
Map<ID,Lead> OldLeadsMap;
Map<ID,Lead> NewLeadsMap;
List<Lead> NewLeadList;
List<MemberOne__c> MemberList = New List<MemberOne__c>();
List<MemberOne__c> Members = [Select ID,Test__c from MemberOne__c ];
List<MemberOne__c> Members1 = New List<MemberOne__c>();

// Constructor to expect the old and new values

public SpecialLeadConverToMemberOne(Map<ID,Lead> OldLeadsTriggerMap, Map<ID,Lead> NewLeadsTriggerMap, List<Lead> NewLeadsTriggerList){
// assign values 
OldLeadsMap = OldLeadsTriggerMap;
NewLeadsMap = NewLeadsTriggerMap;
NewLeadList = NewLeadsTriggerList;


}
//Main methods
public void ConvertToMembers(){
for (Lead L : NewLeadList){
MemberOne__c MO = new MemberOne__c();
MO.Name = L.FirstName + '' + L.LastName;
MO.Email__c = L.Email;
MemberList.add(MO);

}
insert MemberList;
}
public List<MemberOne__c> GetMemberOne(){
return MemberList;
}
public void Change(){
for (MemberOne__c M : Members){
 M.Test__c = String.valueof(GetMemberOne());
 Members1.add(M);
}
Update Members1;
}}