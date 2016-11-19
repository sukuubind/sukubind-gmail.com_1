Trigger UpdateRequirementHistory on Requirement__c (before update,before insert){
UpdateRequirementHistory  UH = new UpdateRequirementHistory(Trigger.oldmap,Trigger.newmap,Trigger.new);
UH.UpdateRequirement();

}