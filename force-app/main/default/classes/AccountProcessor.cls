/**
 * *this class updates a custom field on Account records (Number_Of_Contacts__c) with the # of related contacts
 */
public class AccountProcessor {
  /**
   * * this future method updates the Number_Of_Contacts__c field with the # of related contacts to the corresponding account
   * @param acctIds The parameter for this method.
   */
  @future
  public static void countContacts(List<Id> acctIds) {
    List<Account> accountsToUpdate = new List<Account>();

    for (Id i : acctIds) {
      Integer contactCount = [SELECT COUNT() FROM Contact WHERE AccountId = :i];

      Account acc = new Account(Id = i, Number_Of_Contacts__c = contactCount);
      accountsToUpdate.add(acc);
    }
    update accountsToUpdate;
  }
}
