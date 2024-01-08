@isTest
public class AccountManagerTest {
  @isTest(seeAllData=false)
  static void testgetAccount() {
    Id recordId = createTestRecord();
    // set up a test request
    RestRequest request = new RestRequest();
    request.requestURI =
      'https://creative-panda-45udvj-dev-ed.trailblaze.my.salesforce.com/services/apexrest/Accounts/' +
      recordId +
      '/contacts';
    request.httpMethod = 'GET';
    RestContext.request = request; //* connects the test and test class together
    // call the method to test
    Account thisAcct = AccountManager.getAccount();
    // verify results
    System.assert(thisAcct != null);
    System.assertEquals('Test Account', thisAcct.Name);
  }
  //helper method
  static Id createTestRecord() {
    Account sampleAcct = new Account(Name = 'Test Account');
    insert sampleAcct;

    Contact testCon = new Contact(LastName = 'Doe', AccountId = sampleAcct.Id);
    insert testCon;

    return sampleAcct.Id;
  }
}
