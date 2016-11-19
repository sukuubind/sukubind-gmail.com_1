Trigger UpdateRivalONAccount on Account (before update, before insert){
UpdateRivalOnAccount AA = new UpdateRivalOnAccount();
AA.UpdateRivalOnAccount(Trigger.new);
}