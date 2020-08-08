@isTest 
public class TestLeadKeyFieldsPopulated {
    static testMethod void insertNewLead() {

        Lead ldToCreate = new Lead();

        ldToCreate.FirstName = 'Said';
        ldToCreate.LastName = 'Sham';
        ldToCreate.Phone = '655555555'; //Not my real phone number :)
        ldToCreate.Company = 'SaidSham';
        
        insert ldToCreate;

        Lead ldToCreate2 = new Lead();

        ldToCreate2.FirstName = 'Said';
        ldToCreate2.LastName = 'test';
        ldToCreate2.Phone = 'TEST'; //Not my real phone number :)
        ldToCreate2.Company = 'SaidSham';
        
        insert ldToCreate2;
    }
    static testMethod void insertNewLeadBypass() {

        Lead ldToCreate = new Lead();

        ldToCreate.FirstName = 'Said';
        ldToCreate.LastName = 'test';
        ldToCreate.Phone = '655555555'; //Not my real phone number :)
        ldToCreate.Company = 'SaidSham';
        ldToCreate.Bypass_Triggers__c = true;

        insert ldToCreate;
    }
}