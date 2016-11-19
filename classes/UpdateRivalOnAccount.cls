public class UpdateRivalOnAccount {
public void UpdateRivalOnAccount (List<Account> ListFromTrigger){
for (Account A : ListFromTrigger){
if (A.Rival_picklist__c != null){
Rival__c R = [Select id,Name from Rival__c where Name = : A.Rival_picklist__c];
if (R != null){
A.Rival__c = R.id;
}

}
}

}
}