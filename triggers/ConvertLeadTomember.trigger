Trigger ConvertLeadTomember on Lead (before update, after update, before insert, after insert, before delete, after delete){
if (Trigger.isUpdate){
if (Trigger.isAfter){
SpecialLeadTomember SLM = new SpecialLeadTomember(Trigger.oldmap,Trigger.newMap,Trigger.new);
SLM.ConvertLeadToMember();
SLM.ReturnMembers();

}
}
if(Trigger.isInsert){
SpecialLeadTomember  SLM = new SpecialLeadTomember(Trigger.oldmap,Trigger.newMap,Trigger.new);
SLM.ConvertLeadToMember();
SLM.ReturnMembers();

}
if (Trigger.isDelete){}
}