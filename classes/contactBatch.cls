// Apex Class that implements the Batchable interface
global class contactBatch implements Database.Batchable<SObject>,Database.Stateful{
global Integer counter;
global Database.QueryLocator start(Database.BatchableContext ctx){counter = 0;
return Database.getQueryLocator('Select ID,Phone,Account.phone from Contact ');

}
global void execute(
Database.BatchableContext ctx, List<SObject> sobjects) {
List<Contact> contacts = (List<Contact>) sobjects;
for (Contact c : contacts){
c.phone = c.Account.phone;
counter ++;
}
update Contacts;

}
global void finish(Database.BatchableContext ctx){
// Log an activity and send an email
system.debug(counter);
Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
email.setTargetObjectID(userInfo.getUserID());
email.setReplyTo('noreply@thisbook.com');
email.setSenderDisplayName('Apex Code');
email.setSubject('Too many emails!');
email.setPlainTextBody('This will not work, nice try!');
email.setUseSignature(false);
email.setSaveAsActivity(false);
messaging.sendEmail(
new List<Messaging.singleEmailMessage>{email});

}

}