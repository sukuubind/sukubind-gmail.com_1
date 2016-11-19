//if anyone tries to create a lead that has an email as an existing contact throw an error
public class DeDupLead{
Map<ID,Lead> OldLeadsMap;
Map<ID,Lead> NewLeadsMap;
List<Lead> NewLeadsList;
Set<String> AllEmails = new Set<String>();

// Create a constructor that will have new and old records as input
public  DeDupLead(Map<ID,Lead> OldLeadTriggerMap, Map<ID,Lead> NewLeadTriggerMap, List<Lead> NewLeadTriggerList){
// Assign the input to the variables

OldLeadsMap = OldLeadTriggerMap;
NewLeadsMap = NewLeadTriggerMap;
NewLeadsList = NewLeadTriggerList;

}
// Main Method
public void MainMethodDeDupOnLead(){
for (Lead  L : NewLeadsList){
if(L.Email != null){
AllEmails.add(L.Email);
}
}
List<Contact> ContactWithEmail = [Select Email,ID from Contact where Email IN: AllEmails];
Map<String,Contact> ContactMap = new Map<String,Contact>();

for (Contact C : ContactWithEmail){
ContactMap.put(C.EMail,C);
}
for (Lead L : NewLeadsList){
if (L.Email != null){
Contact Con = ContactMap.get(L.Email);
If (Con != null){
//String errorMessage = 'Lead with this email address already exists! '; 

L.Email.addError('Lead with this email address already exists! ');

}
}
}}

}