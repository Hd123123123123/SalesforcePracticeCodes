//Write a trigger to validate that an Account cannot have more than 5 open Opportunities.


trigger OpportunityTrigger on Opportunity (before insert, after update, after insert) {

    if(Trigger.isBefore && Trigger.isInsert){

        practiceClass2.checkAccountsOpportunityCount(trigger.new);

    }

    Set<Id> opportunityIds = new Set<Id>();
    if(trigger.isAfter && trigger.isUpdate){

        for(Opportunity opp : trigger.new){
            opportunityIds.add(opp.Id);
        }
        if(!opportunityIds.isEmpty()){
            practiceClass2.updateAmountOnAccount(opportunityIds);
        }
       
    }

    if(trigger.isAfter && trigger.isInsert){
          for(Opportunity opp : trigger.new){
            opportunityIds.add(opp.Id);
          }
        if(!opportunityIds.isEmpty()){
            practiceClass2.updateAmountOnAccount(opportunityIds);
        }
    }

    

}