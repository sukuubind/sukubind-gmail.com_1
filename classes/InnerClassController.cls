public class InnerClassController {
public list<OppWrapper> contactList{get;set;}
public integer A {get;set;}
public Account acct {get;set;}
public InnerClassController() {
String acctid= ApexPages.currentPage().getParameters().get('id');
acct = [Select id,Rating,Name,ownerid from Account where ID  =: acctid];
}

//public PageReference save(){
//update acct;
//return new PageReference('/' + acct.id);
//}





public list<OppWrapper> getchildOpps(){

if(contactList == null) {
contactList = new List<OppWrapper>();
for (Opportunity O : [Select ID,Name,Amount,StageName,CloseDate,OwnerID,IsClosed from Opportunity where AccountID =: acct.id and (IsWon = true or IsClosed = false)]){
contactList.add(new OppWrapper(O));


}
}
return contactList;

}



public class OppWrapper {

 public Opportunity opp {get;set;}
 public Integer closedTaskCount {get;set;}
 public  OppWrapper( Opportunity B){
 
 opp = B;
  
 }
}

public Integer getReturnTaskClosed(){
List<Task> TaskClosed = [Select Id from task where status = 'Completed' and  whatID IN (select ID from Opportunity where accountid =: acct.id) ];
List<Task> TaskClosed1 = [Select Id from task where status = 'Completed' and  whatID  =: acct.id ];
Integer B = TaskClosed1.size();
Integer C = TaskClosed.size();
Integer A = B + C;
return A;
}



private void createTaskOnChildOpps() {
List<Task> tasksToInsert = new List<Task>();
for (Opportunity opp : [Select ID,Name,Amount,StageName,CloseDate,OwnerID,IsClosed from Opportunity where AccountID =: acct.id and (IsWon = true or IsClosed = false)]){
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
for (Opportunity opp : [Select ID,Name,Amount,StageName,CloseDate,OwnerID,IsClosed from Opportunity where AccountID =: acct.id and (IsWon = true or IsClosed = false)]){
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
for (Opportunity opp : [Select ID,Name,Amount,StageName,CloseDate,OwnerID,IsClosed from Opportunity where AccountID =: acct.id and (IsWon = true or IsClosed = false)]){
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