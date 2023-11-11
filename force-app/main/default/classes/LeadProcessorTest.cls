/**
 * *This class tests the LeadProcessor class. It creates 200 test leads that don't have an inputted lead souce and asserts that the lead source is updated to 'Dreamforce' for each test lead.
 * The test setup method is used here to create the test data
 * This test is an example of Batch Apex at work.
 */
@isTest
public class LeadProcessorTest {
  @TestSetup
  static void setup() {
    List<Lead> leads = new List<Lead>();
    //insert 10 test leads
    for (Integer i = 0; i < 200; i++) {
      leads.add(
        new Lead(
          LastName = 'LastName ' + i,
          Company = 'Company ' + i,
          Status = 'Open - Not Contacted'
        )
      );
    }
    insert leads;
  }
  @isTest
  static void test() {
    Test.startTest();
    LeadProcessor lp = new LeadProcessor();
    Id batchId = Database.executeBatch(lp);
    Test.stopTest();

    System.assertEquals(
      200,
      [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']
    );
  }
}
