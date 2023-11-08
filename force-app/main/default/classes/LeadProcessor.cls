public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT LeadSource From Lead]);
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> leads = new List<Lead>();
        for (Lead l : scope) {
            l.LeadSource = 'Dreamforce';
            leads.add(l);

            recordsProcessed++;
        }
        update leads;
    }
    public void finish(Database.BatchableContext bc) {
        System.debug(recordsProcessed + ' records processed.');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()];

        // EmailUtils.sendMessage(job, recordsProcessed);
    }
    // public LeadProcessor() {

    // }
}