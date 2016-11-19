public class CreateContactFromCandidate{
public void CreateContact(List<Candidate__c>  ListFromTrigger){
Account A = [Select ID,Name from Account where Name = 'GenePoint'];
//List for the object that has to be updated
List<Contact> Cont = new List<Contact>();
for (Candidate__c  C : ListFromTrigger){
Contact CT = new Contact();
//CT.FirstName = C.FirstName;
CT.LastName = C.Name;
List<Contact> ABC = [Select ID,AccountID,Name from Contact where Name =: C.Name];
IF(ABC.size() > 0) {
CT.AccountID = ABC[0].Accountid;
}
Else if (ABC.size() == 0) {
CT.AccountID = A.ID;}
//CT.Email = C.Email__c;
Cont.add(CT);

}
 Insert Cont;}}