public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String name) {
        List<List<sObject>> searchList = [FIND :name IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];

        /*String searchString = '\'*'+name+'*\'';
        String soslQuery = 'FIND ' + searchString + ' FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName) ';
        List<List<SObject>> searchList =  Search.query(soslQuery);*/
        
        System.debug(searchList);
        return searchList;
    }
}
