public class AccountProcessor {
    @future
    public static void countContacts(List<Id> acctIds) {
        List<Account> accountsToUpdate = new List<Account>();
        
        for (Id i : acctIds ) {
            Integer contactCount = [SELECT COUNT() FROM Contact WHERE AccountId = :i];
            
            Account acc = new Account(Id = i, Number_Of_Contacts__c = contactCount);
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;    
    }
}