public with sharing class practiceClass2 {
    public practiceClass2() {

    }

    public static void checkAccountsOpportunityCount(List<Opportunity> oppRecords){
        Set<Id> accountIds = new Set<Id>();
       
        for(Opportunity opp : oppRecords){
            System.debug('opp =>' + opp.AccountId);
            if(opp.AccountId != null){
                 accountIds.add(opp.AccountId);
               
            }
        }

        if(!accountIds.isEmpty()){
            Map<Id, List<Opportunity>> accountIdWithOpp = new Map<Id, List<Opportunity>>();
         
                for(Opportunity oppRecs : [SELECT Id,Name, AccountId, StageName FROM Opportunity WHERE AccountId IN : accountIds AND StageName NOT IN ('Closed Won','Closed Lost')]){
                        System.debug('Opp Rec NAME => ' + oppRecs.Name);    

                        if(accountIdWithOpp.containsKey(oppRecs.AccountId)){
                            accountIdWithOpp.get(oppRecs.AccountId).add(oppRecs);
                        }else {
                            accountIdWithOpp.put(oppRecs.AccountId, new List<Opportunity>{oppRecs});
                        }
                }

            if(!accountIdWithOpp.isEmpty()){

                
                for(Opportunity op : oppRecords){
                    System.debug('List Size ' +  accountIdWithOpp.get(op.AccountId).size());
                    if(accountIdWithOpp.get(op.AccountId).size() >= 5){
                        op.addError('This Account is Alredy have more than 5 Open Opportunities!');
                    }
                }

            }
        
            
        }
         
    }
    
}