@isTest
public class TestAccountCallableContacts {
    static testMethod void insertNewContact() {

        Contact cont = new Contact();
        Contact cont2 = new Contact();
        Contact cont3 = new Contact();
        Contact cont4 = new Contact();
        Account acc = new Account();

        Set<Id> accId = new Set<Id>();

        //INSERT TESTS

        acc.Name = 'TEST ACC';
        acc.Callable_Contacts__c = 0;
        insert acc;
        accId.add(acc.Id);

        cont.LastName  = 'TEST 1';
        cont.AccountId = acc.Id;
        cont.Phone = '655555555';
        insert cont;
        
        List<Account> accSOQL = new List<Account>([SELECT Callable_Contacts__c FROM Account WHERE Id IN :accId]);

        for (Account accfor : accSOQL) {
            System.assertEquals(1, accfor.Callable_Contacts__c);
        }

        cont2.LastName  = 'TEST 2';
        cont2.AccountId = acc.Id;
        cont2.Phone = '655555554';
        insert cont2;

        accSOQL = new List<Account>([SELECT Callable_Contacts__c FROM Account WHERE Id IN :accId]);
        
        for (Account accfor : accSOQL) {
            System.assertEquals(2, accfor.Callable_Contacts__c);
        }

        cont3.LastName  = 'TEST 3';
        cont3.AccountId = acc.Id;
        insert cont3;

        accSOQL = new List<Account>([SELECT Callable_Contacts__c FROM Account WHERE Id IN :accId]);
        
        for (Account accfor : accSOQL) {
            System.assertEquals(2, accfor.Callable_Contacts__c);
        }

        cont4.LastName  = 'TEST 4';
        cont4.Phone = '655555553';
        insert cont4;

        accSOQL = new List<Account>([SELECT Callable_Contacts__c FROM Account WHERE Id IN :accId]);
        
        for (Account accfor : accSOQL) {
            System.assertEquals(2, accfor.Callable_Contacts__c);
        }

        //UPDATE TESTS

        cont3.Phone = '655555552';
        update cont3;

        accSOQL = new List<Account>([SELECT Callable_Contacts__c FROM Account WHERE Id IN :accId]);
        
        for (Account accfor : accSOQL) {
            System.assertEquals(3, accfor.Callable_Contacts__c);
        }

        cont4.AccountId = acc.Id;
        update cont4;

        accSOQL = new List<Account>([SELECT Callable_Contacts__c FROM Account WHERE Id IN :accId]);
        
        for (Account accfor : accSOQL) {
            System.assertEquals(4, accfor.Callable_Contacts__c);
        }

        //DELETE TESTS

        delete cont4;

        accSOQL = new List<Account>([SELECT Callable_Contacts__c FROM Account WHERE Id IN :accId]);
        
        for (Account accfor : accSOQL) {
            System.assertEquals(3, accfor.Callable_Contacts__c);
        }

        delete cont3;

        accSOQL = new List<Account>([SELECT Callable_Contacts__c FROM Account WHERE Id IN :accId]);
        
        for (Account accfor : accSOQL) {
            System.assertEquals(2, accfor.Callable_Contacts__c);
        }
    }
}