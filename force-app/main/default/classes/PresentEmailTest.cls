/**
 * Created by maxpr on 24.02.2022.
 */
@IsTest
private class PresentEmailTest {

    @IsTest

    private static void presentEmailTest() {
        Account acc = new Account (
                Name = 'newAcc1'
        );
        insert acc;
        Contact contact = new Contact(
                FirstName = 'test',
                LastName = 'test',
                Email = 'test@test.com',
                Birthdate = Date.today(),
                AccountId = acc.Id,
                Language__c = 'de'
        );
        insert contact;

        Test.startTest();
        Database.executeBatch(new PresentEmail());
        Test.stopTest();

       // System.assertEquals(Limits.getEmailInvocations(), Limits.getLimitEmailInvocations() -1, 'Success!');
    }
}