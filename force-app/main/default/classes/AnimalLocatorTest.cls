/**
 * * This test class tests the AnimalLocator class. The AnimalLocator class performs a get request that returns an animal name, given the id.
 */
@isTest
public class AnimalLocatorTest {
  @isTest(seeAllData=false)
  static void test() {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

    String animalName = AnimalLocator.getAnimalNameById(1);

    // Assert that the returned animal name is "chicken"
    System.assertEquals('chicken', animalName, 'Unexpected animal name');
  }
}