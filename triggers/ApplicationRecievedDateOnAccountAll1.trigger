Trigger ApplicationRecievedDateOnAccountAll1 on Opportunity (before insert,before update){

ApplicationRecievedDateOnAccountAll AA = new ApplicationRecievedDateOnAccountAll(Trigger.oldMap,Trigger.newMap,Trigger.new);
AA.AppRecd();
}