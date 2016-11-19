Trigger CaseLimit on Case (before insert){
CaseLimitOnUser CL = new CaseLimitOnUser(Trigger.oldmap,Trigger.newmap,trigger.new);
CL.CaseLimit();

}