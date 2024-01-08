/**
 * * Trailhead example: Exposing a REST based GET endpoint for Accounts
 */
@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {
  @HttpGet
  global static Account getRecord() {
    // Add your code
  }
}
