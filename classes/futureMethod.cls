public class futureMethod{
@future
public static void updateContactsLater(Set<Id> contactIds) {
 List<Contact> contactUpdates = new List<Contact>();

 for ( Contact c : [
 Select Id, Phone, Account.Phone
 from Contact
 where Id in :contactIds
 ]){
 c.Phone = c.Account.Phone;
 contactUpdates.add(c);
 }
 update contactUpdates;
}
}