/**
 * Created by maxpr on 22.02.2022.
 */

public with sharing class EmailService {
    private static final Map<String, Id> TEMPLATE_ID_BY_NAME;
    static {
        List<EmailTemplate> templates = [SELECT Id, DeveloperName FROM EmailTemplate];
        TEMPLATE_ID_BY_NAME = new Map<String, Id>();
        for (EmailTemplate template : templates) {
            TEMPLATE_ID_BY_NAME.put(template.DeveloperName, template.Id);
        }
    }

    public static Messaging.SingleEmailMessage getEmailTemplate(String tempName, Id recipientId, Id whatId) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setTargetObjectId(recipientId);
        email.setTemplateId(TEMPLATE_ID_BY_NAME.get(tempName));
        email.setWhatId(whatId);
        return email;
    }
}
