/**
 * * This class performs a get request that returns an animal name, given the id.
 */
public class AnimalLocator {
  /**
   * * This method returns the animal name as a string, given the id.
   * @param id The parameter where you input the id.
   */
  public static String getAnimalNameById(Integer id) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      'https://th-apex-http-callout.herokuapp.com/animals/' + id
    );
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    String animalName = '';
    if (response.getStatusCode() == 200) {
      // convert json string to an object
      Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(
        response.getBody()
      );
      Map<string, object> animals = (map<string, object>) results.get('animal');
      animalName = string.valueof(animals.get('name'));
    } else {
      System.debug(response.getBody());
    }
    return animalName;
  }
}
