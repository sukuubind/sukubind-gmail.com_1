trigger candidateTrigger on Candidate__c (before delete) { 


     for (Job_Application__c jobApp : [SELECT Candidate__c 


                                       FROM Job_Application__c 


                                       WHERE Candidate__c 


                                       IN :Trigger.oldMap.keySet()]) { 


         Trigger.oldMap.get(jobApp.Candidate__c).addError( 


                    'Cannot delete candidate with a job application'); 


     } 


 }