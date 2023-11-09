/**
 * * This trigger prevents account inserts or updates if Match_Billing_Address__c field on the account record is checked and the shipping zip code doesn't match the billing zip code.
 */
trigger AccountAddressTrigger on Account(before insert, before update) {
  for (Account a : Trigger.new) {
    if (a.Match_Billing_Address__c) {
      a.ShippingPostalCode = a.BillingPostalCode;
    }
  }

}
