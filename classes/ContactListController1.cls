public class ContactListController1 {
private string sortOrder = 'LastName';

public List<Contact> getContacts(){

List<Contact> results = Database.query('SELECT Id, FirstName, LastName, Title, Email  FROM Contact where Email != null ORDER BY ' + sortOrder + ' ASC ' );
return results;
}
public void sortByFirstName(){
this.sortOrder = 'FirstName';
}
}