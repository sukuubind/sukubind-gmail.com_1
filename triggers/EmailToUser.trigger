Trigger EmailToUser on Case(before update, after update,before insert,after insert, before delete, after delete){
if (Trigger.IsUpdate){
if (Trigger.IsBefore){
EmailToUser EU = new EmailToUser(Trigger.oldMap,Trigger.newMap,Trigger.new);
EU.EmailToUserMethod();
}
}
if(Trigger.IsDelete){}
if(Trigger.IsInsert){}
}