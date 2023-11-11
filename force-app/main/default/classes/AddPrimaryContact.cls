/**
 * * This class adds a contact (passed as an argument) to a list of accounts that have a specific Billing state in their address (passed as an argument). This is an example of Queueable Apex.
 */
public with sharing class AddPrimaryContact implements Queueable {
  private Contact contact;
  private String state;
  /**
   * * This constructor takes in the contact and billing state of the accounts
   * @param contact The parameter where the user inputs the Contact record
   * @param state The paramater where the user inputs the billing state of the accounts
   */
  public AddPrimaryContact(Contact contact, String state) {
    this.contact = contact;
    this.state = state;
  }

  public void execute(QueueableContext context) {
    //query for max of 200 accts with specified state abbreviation
    List<Account> accounts = [
      SELECT Id, BillingState
      FROM Account
      WHERE BillingState = :state
      LIMIT 200
    ];

    // List to store the contacts to add
    List<Contact> contactsToAdd = new List<Contact>();

    // Clone the contact for each acct. and add it to the list
    // cloning prevents duplicate contacts error
    for (Account acct : accounts) {
      Contact clonedContact = contact.clone();
      clonedContact.AccountId = acct.Id;
      contactsToAdd.add(clonedContact);
    }

    // Insert the contactsToAdd records
    insert contactsToAdd;
  }
}
