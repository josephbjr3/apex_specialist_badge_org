@isTest
public class TestVerifyDate {
    @isTest static void testDate2BeforeDate1(){
        Date resultDate = VerifyDate.CheckDates(Date.valueOf('2023-01-02'), Date.valueOf('2023-01-01'));
        System.assertEquals(Date.valueOf('2023-01-31'), resultDate);    
    }
    
    @isTest static void testDateWithin30Days(){
        Date resultDate = VerifyDate.CheckDates(Date.valueOf('2023-01-01'), Date.valueOf('2023-01-30'));
        System.assertEquals(Date.valueOf('2023-01-30'), resultDate);
    }
   
    @isTest static void testDateNotWithin30Days(){
        Date resultDate = VerifyDate.CheckDates(Date.valueOf('2023-01-01'), Date.valueOf('2023-02-01'));
        System.assertEquals(Date.valueOf('2023-01-31'), resultDate);
    }
}