public class ContactListControllerWithCommandButton {
private string sortOrder = 'LastName';

public List<Contact> GetContacts(){

List<Contact> results = Database.query('select id,FirstName,LastName,Email,title from Contact where Email != null ORDER BY ' + sortOrder + ' ASC ');
return results;
}

public void sortByLastName(){
this.sortOrder = 'LastName';
}

public void sortByFirstName(){
this.sortOrder = 'FirstName';
}
}