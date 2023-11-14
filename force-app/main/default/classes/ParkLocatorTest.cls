/**
 * * This class tests the ParkLocator class. The ParkLocator class uses the ParkService class to get a string array of names for parks in a given country.
 */
@isTest
private class ParkLocatorTest {
  @isTest
  static void testParkLocator() {
    Test.setMock(WebServiceMock.class, new ParkServiceMock());
    String[] names = ParkLocator.country('Japan');

    System.assertEquals('Park1', names[0]);
  }
}
