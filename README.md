# EmailSend
This method wishes users a happy birthday in the language of their contact,
which can be set during contact creation.(*Spanish, German, English.*)
To use the method, you should create your own organization. You can use macros for this.

**This part is responsible for sorting contacts whose birthday is today.**
~~~
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
                SELECT Id, AccountId
                FROM Contact
                WHERE Birthdate = TODAY
        ]);
    }
~~~
**Send messages to users.**
```
    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for (Contact contact : scope) {
            emails.add(EmailService.getEmailTemplate('Present', contact.Id, contact.AccountId));
        }
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
```
**This is a message template.**
~~~
<messaging:emailTemplate subject="{!$Label.Congratulation}"
                         recipientType="Contact"
                         relatedToType="Account"
                         language="{!recipient.Language__c}">
    <messaging:htmlEmailBody>
        {!$Label.Hello}, {!recipient.Name}!<br/>
        {!$Label.Body}<br/>
        <img src="{!$Resource[$Label.Flag]}"/>
    </messaging:htmlEmailBody>
</messaging:emailTemplate>
~~~

[Please see guide for scratch org creation at path](https://github.com/maxprogood/EmailSend/blob/master/force-app/main/default/Doc/Create%20Scrch%20Org.md)</br>

