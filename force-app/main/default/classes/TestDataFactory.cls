/**
 * * This class is the TestDataFactory. It's a special class for createing sample data for Apex testing.
 */
@isTest
public class TestDataFactory {
    /**
     * * This method creates Accounts with related opportunities
     * @param numAccts The parameter where you input the number of Accounts you want to create
     * @param numOppsPerAcct The parameter where you input the number of Opportunities per Account
     */
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        return accts;
    }
    /**
     * * This method creates Accounts with related contacts
     * @param numAccts The parameter where you input the number of Accounts you want to create
     */
    public static List<Account> createAccountsWithContacts(Integer numAccts){
        List<Account> accts = new List<Account>();
        for(integer i=0; i<numAccts; i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Contact> contacts = new List<Contact>();
        for(integer i=0; i < numAccts; i++){
            Account acct = accts[i];
            for(integer j=0; j < Integer.valueof((Math.random() * 50)); j++){
                contacts.add(new Contact(FirstName = acct.Name + ' TestFirstName ' + j,
                                         LastName = acct.Name + ' TestLastName ' + j,
                                         AccountId = acct.Id));
            }       
        }
        insert contacts;    
        return accts;
    }
    
}