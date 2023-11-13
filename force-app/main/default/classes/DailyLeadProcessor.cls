/**
 * * This class updates a max of 200 leads with a blank lead source to have a lead source value of 'Dreamforce'. This is an example of scheduled apex. (although this job isn't actually scheduled)
 */
public with sharing class DailyLeadProcessor implements Schedulable {
  public void execute(SchedulableContext ctx) {
    //query for max of 200 leads with blank lead source
    List<Lead> leads = [
      SELECT LeadSource
      FROM Lead
      WHERE LeadSource = NULL
      LIMIT 200
    ];

    // Create list to hold updated leads. Update the leadsource for the leads and add them to the updated leads list
    List<Lead> updatedLeads = new List<Lead>();
    for (Lead lead : leads) {
      lead.LeadSource = 'Dreamforce';
      updatedLeads.add(lead);
    }

    // update leads in SF
    update updatedLeads;
  }
}