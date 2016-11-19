public class Pcontroller {

public Account acct {get;set;}
public Pcontroller() {
String acctid= ApexPages.currentPage().getParameters().get('id');
acct = [Select id,Rating,Name,ownerid from Account where ID  =: acctid];
}

//public PageReference save(){
//update acct;
//return new PageReference('/' + acct.id);
//}

public list<Opportunity> childOpps{
get{
if(childOpps == null) {
childOpps = [Select ID,Name,Amount,StageName,CloseDate,OwnerID,IsClosed from Opportunity where AccountID =: acct.id and (IsWon = true or IsClosed = false)];
}
return childOpps;
}
set;
}
private void createTaskOnChildOpps() {
List<Task> tasksToInsert = new List<Task>();
for (Opportunity opp : childOpps){
if (!opp.isClosed){
Task NT = new Task();
NT.Whatid = opp.id;
NT.ownerid = opp.ownerid;
NT.ActivityDate = Date.today() + 3;
NT.Status = 'Not Started';
NT.Subject = 'Send follow up email to primary contact';
tasksToInsert.add(NT);
}}
insert tasksToInsert;
}

private void createCallTaskOnChildOpps() {
List<Task> tasksToInsert1 = new List<Task>();
for (Opportunity opp : childOpps){
if (!opp.isClosed){
Task NT = new Task();
NT.Whatid = opp.id;
NT.ownerid = opp.ownerid;
NT.ActivityDate = Date.today() ;
NT.Status = 'In Progress';
NT.Subject = 'Log a call';
tasksToInsert1.add(NT);
}}
insert tasksToInsert1;
}

private void createMemberOne() {
List<MemberOne__c> MemberOneToInsert = new List<MemberOne__c>();
for (Opportunity opp : childOpps){
if (!opp.isClosed){
MemberOne__c NT = new MemberOne__c();
NT.Email__c = 'ABC@email.com';
NT.Test__c = 'This MemberOne has been created thru the class createMemberOne';
MemberOneToInsert.add(NT);
}}
insert MemberOneToInsert;
}
public pageReference save(){
if (acct.Rating == 'Hot') {
createTaskOnChildOpps();
}
else {
if(acct.Rating == 'Warm'){
createCallTaskOnChildOpps();
createMemberOne();
}

}
update acct;
return new pageReference('/' + acct.id);
}
}