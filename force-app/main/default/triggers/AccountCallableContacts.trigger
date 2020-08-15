trigger AccountCallableContacts on Contact (after insert, after update, before delete, after undelete) {
    if (Trigger.isDelete) { //delete
        for (Contact cont : Trigger.old) {
            Set<Id> accId = new Set<Id>();
            if (cont.AccountId != null && cont.Phone != null) {
                accId.add(cont.AccountId);
                List<Account> accWithPhone = new List<Account>([SELECT Id, Callable_Contacts__c, (SELECT Id, LastName, AccountId FROM Contacts) FROM Account WHERE Id IN :accId]);
                List<Contact> contWithPhone = new List<Contact>([SELECT Id FROM Contact WHERE AccountId IN :accId AND Phone != null]);
                for (Account acc : accWithPhone) {
                    if (!contWithPhone.isEmpty()) {
                        acc.Callable_Contacts__c = contWithPhone.size()-1; 
                    }
                }
                update accWithPhone;
            }
        }
    }
    else { //insert, update, undelete
        for (Contact cont : Trigger.new) {
            Set<Id> accId = new Set<Id>();
            if (cont.AccountId != null) {
                accId.add(cont.AccountId);
                List<Account> accWithPhone = new List<Account>([SELECT Id, Callable_Contacts__c, (SELECT Id, LastName, AccountId FROM Contacts) FROM Account WHERE Id IN :accId]);
                List<Contact> contWithPhone = new List<Contact>([SELECT Id FROM Contact WHERE AccountId IN :accId AND Phone != null]);
                for (Account acc : accWithPhone) {
                    if (!contWithPhone.isEmpty()) {
                        acc.Callable_Contacts__c = contWithPhone.size(); 
                    }
                }
                update accWithPhone;
            }
        }
    }
}