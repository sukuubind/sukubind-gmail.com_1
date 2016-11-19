@isTest 
public class TestFindDupes {
    static testMethod void testDupes() {
Contact Cont = new Contact();
Cont.email = 'jjjjjj@mail.com';
cont.lastname = 'atry';
cont.firstname = 'atry';
insert Cont;

Lead L = new Lead();
L.firstname = 'abc';
L.Lastname = 'abc';
L.Email = 'jjjjjj@mail.com';
L.Company = 'AAA';
 try {
           insert L;
       } catch (Exception e) { 
           System.debug('An error happened, as predicted!');
       }

List<Lead> Leads = [Select ID,Email from Lead where Email =: 'jjjjjj@mail.com'];
System.assertEquals(Leads.size(),0);

Lead A = new Lead();
A.firstname = 'Kiran';
A.lastname = 'Bondili';
A.Email = 'bbb2@mail.com';
A.Company = 'BBB';
insert A;
List<Lead> Leads1 = [Select ID,Email from Lead where Email =: 'bbb2@mail.com'];
System.assertEquals(Leads1.size(),1);
}}