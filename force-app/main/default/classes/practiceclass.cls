/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : practiceclass
 * Author          : <YourName>
 * Created Date    : Oct 28, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Oct 28, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Oct 28, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public with sharing class practiceclass {

	@AuraEnabled(cacheable = true)
	public static List<Account> getAccountsRecords(Integer offsetVal){

		return [SELECT Id, Name FROM Account LIMIT 10 OFFSET : offsetVal];

	}
    
    
    
    
    //first, without writing the LWC yet, write an Apex class with two methods, one to fetch Account records, 
    //and one to delete an Account by ID. Make the fetch method cacheable.
    //
    
    public static List<Account> getAccountRecords(){
        
        return [SELECT Id, Name FROM Account];
        
    }
    
    public static void deleteAccountById(String recordId){
        
        Account acc = new Account();
        
        acc.Id = recordId ;
          
        
        delete acc ;
        
    }
    
    
    
    
    
    
}