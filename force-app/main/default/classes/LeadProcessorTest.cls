@isTest
public class LeadProcessorTest {
    @TestSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        //insert 10 leads
        for (Integer i=0; i<200; i++) {
            leads.add(new Lead(LastName = 'LastName ' + i, Company = 'Company ' + i, Status = 'Open - Not Contacted'));
        }
        insert leads;        
    }
    @isTest
    static void test() {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
    // public LeadProcessorTest() {

    // }
}