public class PresentEmail implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
                SELECT Id, AccountId
                FROM Contact
                WHERE Birthdate = TODAY
        ]);
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for (Contact contact : scope) {
            emails.add(EmailService.getEmailTemplate('Present', contact.Id, contact.AccountId));
        }
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }

    }

    public void finish(Database.BatchableContext bc) {
    }

}
