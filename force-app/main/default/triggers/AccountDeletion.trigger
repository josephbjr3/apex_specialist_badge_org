/**
 * * This trigger prevents account deletion if it has related opportunities
 */
trigger AccountDeletion on Account(before delete) {
  // ".addError" is what actually prevents the deletion
  for (Account a : [
    SELECT Id
    FROM Account
    WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old
  ]) {
    Trigger.oldMap
      .get(a.Id)
      .addError('Cannot delete account with related opportunities.');
  }
}