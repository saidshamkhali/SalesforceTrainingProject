@isTest 
public class TestOpportunityAccount {
    static testMethod void insertNewAccount() {

        Account accountToCreate = new Account();

        accountToCreate.Name = 'Said';
        accountToCreate.NumberOfEmployees = 100;
        
        insert accountToCreate;
    }
}