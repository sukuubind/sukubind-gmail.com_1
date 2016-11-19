public class WinningOpportunity{
//Define the variables that will accept Trigger.oldMap,Trigger.newMap and Trigger.new List
Map<ID,Opportunity> oldOpps;
Map<ID,Opportunity> newOpps;
List<Opportunity> newList;

// Create a constructor that will accept the Trigger Old/new values from the List
public WinningOpportunity(Map<ID,Opportunity> oldTriggerOpps, Map<ID,Opportunity> newTriggerOpps, List<Opportunity> newListOpps){
oldOpps = oldTriggerOpps;
newOpps = newTriggerOpps;
newList = newListOpps;
}
// Main Method 

public void WinningOpp () {
for (Opportunity Opp : newList){

Opportunity OldOpp = oldOpps.get(Opp.id);
Boolean OldOppIsWon = OldOpp.StageName.equals('Closed Won');
Boolean newOppIsWon = Opp.StageName.equals('Closed Won');

if(!OldOppIsWon && newOppIsWon){
Opp.I_am_awesome__c = true;

}
}
}
}