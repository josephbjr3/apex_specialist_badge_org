/**
 * * This mock class provide a mock string array of ['Park1','Park2','Park3']
 */
@isTest
global class ParkServiceMock implements WebServiceMock {
  global void doInvoke(
    Object stub,
    Object request,
    Map<String, Object> response,
    String endpoint,
    String soapAction,
    String requestName,
    String responseNS,
    String responseName,
    String responseType
  ) {
    ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
    List<String> names = new List<String>{
      'Park1',
      'Park2',
      'Park3'
    };
    response_x.return_x = names;

    response.put('response_x', response_x);
  }
}
