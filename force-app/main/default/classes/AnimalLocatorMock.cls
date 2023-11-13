/**
 * * This class is a mock class to facilitate AnimalLocator class testing. It creates a fake get response for when id equals 1.
 */
public class AnimalLocatorMock implements HttpCalloutMock {
  // Implement this interface method
  public HTTPResponse respond(HTTPRequest req) {
    // Create a fake response
    HTTPResponse res = new HTTPResponse();
    if (req.getEndpoint().endsWith('animals/1')) {
      res.setBody(
        '{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}'
      );
      res.setStatusCode(200);
    } else {
      System.assert(false, 'unexpected endpoint ' + req.getEndpoint());
      return null;
    }
    return res;
  }
}
