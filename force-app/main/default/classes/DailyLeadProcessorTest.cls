/**
 * * This class tests the DailyProcessorTest class. The DailyProcessorTest class updates a max of 200 leads with a blank lead source to have a lead source value of 'Dreamforce'.
 */
@isTest
public with sharing class DailyLeadProcessorTest {
  // Dummy CRON expression: midnight on March 15 in year 2042
  // Because this is a test, job executes
  // immediately after Test.stopTest(). execute because of )
  public static String CRON_EXP = '0 0 0 15 3 ? 2042';

  @TestSetup
  static void setup() {
    // insert 200 test leads
    List<Lead> leads = new List<Lead>();
    for (Integer i = 0; i < 200; i++) {
      leads.add(new Lead(LastName = 'LastName ' + i, Company = 'Company ' + i));
    }
    insert leads;
  }

  @isTest
  static void test() {
    // Schedule the test job
    Test.startTest();
    DailyLeadProcessor dlp = new DailyLeadProcessor();
    String jobId = System.schedule(
      'Update Lead Source to Dreamforce',
      CRON_EXP,
      dlp
    );
    // Verify the scheduled job has not run yet.
    System.assertEquals(
      0,
      [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']
    );
    Test.stopTest();
    // Now that the scheduled job has executed,
    // assert that the test leads' lead source
    // has been updated to 'Dreamforce'
    System.assertEquals(
      200,
      [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']
    );
  }
}