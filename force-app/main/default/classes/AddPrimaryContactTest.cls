/**
 * This class tests the AddPrimaryContact class. The AddPrimaryContact class adds a contact (passed as an argument) to a list of accounts that have a specific Billing state in their address (passed as an argument)
 */
@isTest
public with sharing class AddPrimaryContactTest {
  // create sample Accounts with billing state NY and CA
  @TestSetup
  static void setup() {
    List<Account> accounts = new List<Account>();
    for (Integer i = 0; i < 50; i++) {
      accounts.add(
        new Account(name = 'Test Account ' + i, BillingState = 'NY')
      );
    }
    for (Integer i = 0; i < 50; i++) {
      accounts.add(
        new Account(name = 'Test Account ' + i, BillingState = 'CA')
      );
    }
    insert accounts;
  }
  // create a test contact test, assert that the AddPrimaryContact class adds the test contact to accts. with 'CA' billing state
  @isTest
  static void testQueueable() {
    Contact testContact = new Contact(FirstName = 'Test', LastName = 'Contact');
    AddPrimaryContact apc = new AddPrimaryContact(testContact, 'CA');

    Test.startTest();
    System.enqueueJob(apc);
    Test.stopTest();

    System.assertEquals(
      50,
      [
          SELECT Id, Account.BillingState
          FROM Contact
          WHERE Account.BillingState = 'CA'
        ]
        .size()
    );
  }
}
