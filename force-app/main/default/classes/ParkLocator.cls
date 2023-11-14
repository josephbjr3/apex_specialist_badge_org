/**
 * * This class uses the ParkService class to get a string array of names for parks in a given country
 */
public class ParkLocator {
  /**
   * * This method returns a string array of names for parks in a given country
   * @param country The paramter where you input the country
   */
  public static String[] country(String country) {
    ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
    String[] names = parks.byCountry(country);
    return names;
  }
}
