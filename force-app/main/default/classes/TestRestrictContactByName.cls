/**
 * * This class tests the RestrictContactByName trigger. The RestrictContactByName trigger prevents inserts or updates of contacts record with a last name of 'INVALIDNAME'.
 * The method in this class asserts that a contact with a last name of 'INVALIDNAME' is not allowed to be inserted.
 */
@isTest
public class TestRestrictContactByName {
    @isTest static void testRestrictContactByName() {
        // test the case where the last name = INVALIDNAME
        Contact c = new Contact(
            FirstName = 'John',
            LastName = 'INVALIDNAME'
        );
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() >  0);
        System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML', result.getErrors()[0].getMessage());
    }

}