Trigger DeDupLead on Lead(before update, after update, before insert, after insert, before delete, after delete){
if (Trigger.IsInsert){
if (Trigger.IsBefore){
DeDupLead  DDL = new DeDupLead(Trigger.oldMap,Trigger.newMap,Trigger.new);
DDL.MainMethodDeDupOnLead();
}
}
if (Trigger.IsUpdate){
if (Trigger.IsBefore){
DeDupLead  DDL = new DeDupLead(Trigger.oldMap,Trigger.newMap,Trigger.new);
DDL.MainMethodDeDupOnLead();
}
}
if(Trigger.IsDelete){}
}