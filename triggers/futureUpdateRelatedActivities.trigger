Trigger futureUpdateRelatedActivities on Contact (before update, before insert){
Set<ID> ContactIDSet = new Set<ID>();
for (Contact C : Trigger.new){
ContactIDSet.add(C.id);
}
FutureMethod1.UpdateRelatedActivityLater(ContactIDSet);
}