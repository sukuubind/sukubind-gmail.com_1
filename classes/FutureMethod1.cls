public class FutureMethod1{
@future
public static void UpdateRelatedActivityLater(Set<ID>  ContactIDs){
integer taskCount;
integer eventCount;
List<Contact> ContactUpdates = new List<Contact>();
List<aggregateResult> tskresults  = [Select count(id) from task where whoID IN: ContactIDs];
for (aggregateResult ar : tskresults){
taskCount = (integer)ar.get('expr0');
}

List<aggregateResult> eventresults = [Select count(id) from event where whoid IN: ContactIDs];
for (aggregateResult ar : eventresults){
eventCount = (integer)ar.get('expr0');
}

List<Contact> CList = [Select Name,ID from Contact where ID IN: ContactIDs];
for (Contact C : CList){
C.Activity_Count__c = eventCount + taskCount;
ContactUpdates.add(C);

}
update ContactUpdates;
}


}