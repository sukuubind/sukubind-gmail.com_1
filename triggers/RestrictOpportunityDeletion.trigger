Trigger RestrictOpportunityDeletion on Opportunity (before delete){
for (Opportunity Oppty:
[ SELECT id from Opportunity WHERE  StageName = 'Closed Won' AND id IN :Trigger.old]){
Trigger.oldMap.get(Oppty.id).addError('Cannot delete an Opportunity where Stage = closed won');
}
}