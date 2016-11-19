public with sharing class SelectOpportunityWrapper
{
// the opportunity
public Opportunity opp {get; set;}
// flag to indicate if the user has selected the opportunity
public Boolean selected {get; set;}
// constructor
public SelectOpportunityWrapper()
{
selected=false;
}
// constructor
public SelectOpportunityWrapper(Opportunity inOpp)
{
this();
opp=inOpp;
}
}