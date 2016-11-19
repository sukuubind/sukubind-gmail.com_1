Trigger WinningOpportunityTrigger on Opportunity (before update, before insert, after update, after insert){
if (Trigger.isBefore){
if(Trigger.isInsert){}
if(Trigger.isUpdate){
if(Trigger.isDelete){}

WinningOpportunity  WO = new WinningOpportunity(Trigger.oldMap,Trigger.newMap,Trigger.new);
WO.WinningOpp();



}

}




}