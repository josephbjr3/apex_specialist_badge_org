@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
  @HttpGet
  global static Account getAccount() {
    RestRequest request = RestContext.request;
    // grab the Account id from the end of the url
    String acctId = request.requestURI.substringBetween(
      'Accounts/',
      '/contacts'
    );

    Account result = [
      SELECT ID, Name, (SELECT ID, Name FROM Contacts)
      FROM Account
      WHERE Id = :acctId
    ];

    return result;
  }
}
