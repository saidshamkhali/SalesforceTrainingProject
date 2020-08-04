@isTest 
public class TestCreateContactsAccount {
    static testMethod void insertNewAccount() {

        Account accountToCreate = new Account();

        accountToCreate.Name = 'Said';
        
        insert accountToCreate;
    }
}