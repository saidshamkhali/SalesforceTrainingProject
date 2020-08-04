@isTest
public class TestContactHelloWorld {
    static testMethod void insertNewContact() {
        Contact contactToCreate = new Contact();

        contactToCreate.LastName  = 'Soler';
        
        insert contactToCreate;
    }
}
