@isTest 
public class TestForceForecasting {
    static testMethod void insertNewUser() {
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];

        User userToCreate = new User();
       
        // Do you recognize these fields?
        userToCreate.FirstName = 'David';
        userToCreate.LastName  = 'Liu';
        userToCreate.Email     = 'dvdkliu+sfdc99@gmail.com';
        userToCreate.Username  = 'sfdc-dreamertestsaid@gmail.com';
        userToCreate.Alias     = 'fatty';
        userToCreate.ProfileId = profileId.id;

        // Don't worry about these
        userToCreate.TimeZoneSidKey    = 'America/Denver';
        userToCreate.LocaleSidKey      = 'en_US';
        userToCreate.EmailEncodingKey  = 'UTF-8';
        userToCreate.LanguageLocaleKey = 'en_US';
        
        insert userToCreate;
    }
}