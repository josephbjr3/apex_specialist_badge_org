/**
 * * This class tests the TaskUtil class. It gives the TaskUtil class various state abrreviations inputs and asserts that the task priority string is set to the correct value.
 */
@isTest
private class TaskUtilTest {
    // test case for non CA state abbreviation
    @isTest static void testTaskPriority() {
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
    // test case for CA state abbreviation
    @isTest static void testTaskHighPriority() {
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    // test case for invalid input
    @isTest static void testTaskPriorityInvalid() {
        String pri = TaskUtil.getTaskPriority('Montana');
        System.assertEquals(null, pri);
    }
}