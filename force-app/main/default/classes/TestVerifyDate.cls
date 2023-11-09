/**
 * * This class tests the VerifyDate class. The VerifyDate class verfies that the second inputted date succeeds the first inputted date and is within 30 days. If this condition is met, the second inputted date is returned. Else, the last day of the month of the first inputted date is returned.
 */
@isTest
public class TestVerifyDate {
    // test case 1: the second 2 inputted date preceeds the first inputted date
    @isTest static void testDate2BeforeDate1(){
        Date resultDate = VerifyDate.CheckDates(Date.valueOf('2023-01-02'), Date.valueOf('2023-01-01'));
        System.assertEquals(Date.valueOf('2023-01-31'), resultDate);    
    }
    // test case 2: the second 2 inputted date is within 30 days of the first inputted date
    @isTest static void testDateWithin30Days(){
        Date resultDate = VerifyDate.CheckDates(Date.valueOf('2023-01-01'), Date.valueOf('2023-01-30'));
        System.assertEquals(Date.valueOf('2023-01-30'), resultDate);
    }
   // test case 3: the second 2 inputted date is not within 30 days of the first inputted date
    @isTest static void testDateNotWithin30Days(){
        Date resultDate = VerifyDate.CheckDates(Date.valueOf('2023-01-01'), Date.valueOf('2023-02-01'));
        System.assertEquals(Date.valueOf('2023-01-31'), resultDate);
    }
}