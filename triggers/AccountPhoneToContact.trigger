Trigger AccountPhoneToContact on Account (after update){
AccountPhoneToContact  APTC = new AccountPhoneToContact(Trigger.oldMap,Trigger.newMap,Trigger.new);
APTC.AcctPhone();
}