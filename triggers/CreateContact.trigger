Trigger CreateContact on Candidate__c (after insert,before update){
CreateContactFromCandidate  CC = new CreateContactFromCandidate();
CC.CreateContact(trigger.new);
}