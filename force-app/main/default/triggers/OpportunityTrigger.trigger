
//Write a trigger to validate that an Account cannot have more than 5 open Opportunities.


trigger OpportunityTrigger on Opportunity (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){

        practiceClass2.checkAccountsOpportunityCount(trigger.new);

    }

}