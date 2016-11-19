public with sharing class SidebarSummaryController {

    

    public Map<String,Integer> oppStages { get; set; }
    public SidebarSummaryController(){
    oppStages = new Map<String,Integer>();
  for (AggregateResult ar : [Select stageName,Count(ID) cnt from Opportunity Group by StageName])
  { 
  oppstages.put((String)ar.get('stageName'),(Integer) ar.get('cnt'));
    
}}}