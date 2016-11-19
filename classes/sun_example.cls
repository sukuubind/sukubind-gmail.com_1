//////<<<<<<<<<<<<<<>>>>>>>>>>>>>>////////
/////Created by Nirmal Christopher////////
//////<<<<<<<<<<<<<<>>>>>>>>>>>>>>////////
public class sun_example {  
 public list<wrapperclass> disp_list{get;set;}  
 //Declare a wrapper class  
      public class wrapperclass{  
      
     //custom wrapper datatype  
      public string name{get;set;}  
      public string ssn_number{get;set;}  
      public string name1{get;set;}  
      public string productName{get;set;}  
    }   
   public sun_example() {  
 //define constructor to instantiate the wrapper data type  
   disp_list=new List<wrapperclass>();  
   }  
   //Method for processing logic  
   public void generate_data(){  
 //querying different objects accounts, VF_practice_pages__c, product2 which is not related at all  
     List<account>acc=[select id,Name from account where createddate!=null order by name limit 5];  
      
     list<product2>proList= [SELECT IsActive,Name FROM Product2 WHERE IsActive = true order by name limit 5 ];  
 //Iterate through each list to extract the values and add it to the custom wrapper data type  
       for(account accs:acc){  
          
           for(integer k=0;k<proList.size();k++){  
 //Instantiating the wrapper SObject   
           wrapperclass w=new wrapperclass();  
 //Assigning the wrapper variables from the SObject Fields in the database.  
            
           w.productName=proList[k].name;  
          
 //Adding everthing to the List  
           disp_list.add(w);  
           w.name=accs.name;  
      disp_list.add(w);  
         }  
       }  
     }  
     
   public void cancel_data(){  
     disp_list.clear();  
 }  
 }