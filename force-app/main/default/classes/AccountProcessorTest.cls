/**
 * *This class tests the AccountProcessor class. It leverages the TestDataFactory class to create test data (in this case, Accounts w/ contacts), then asserts that the Number_Of_Contacts__c field has been update for each Account record created by the TestDataFactory class.
 */
@isTest
public class AccountProcessorTest {
    
    @isTest
     public static void testCountContacts(){
        List<Account> testAccounts = TestDataFactory.createAccountsWithContacts(10);
        
        List<Id> acctIds = new List<Id>();
        for(Account acct : testAccounts){
            acctIds.add(acct.Id);
        }
         
        List<Account> accountsBeforeUpdate = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :acctIds];
        Test.startTest();
        AccountProcessor.countContacts(acctIds);
        Test.stopTest();
        
        List<Account> updatedAccounts = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :acctIds];
        for (Integer i = 0; i < acctIds.size(); i++) {
            System.assertNotEquals(accountsBeforeUpdate[i].Number_Of_Contacts__c, updatedAccounts[i].Number_Of_Contacts__c, 'Number_Of_Contacts__c field should have been updated');
        }
    }

}