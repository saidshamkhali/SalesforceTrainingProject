trigger CreateContactsAccount on Account (after insert) {
    List<Contact> contacts = new List<Contact>();
    for(Account acc:Trigger.New){
        for(Integer i = 0; i < 2; i++){
            Contact cont = new Contact();
            cont.AccountId = acc.id;
            cont.LastName = 'Soler';
            cont.FirstName = 'Carles';
            cont.email = 'csoler@csoler.com';
            contacts.add(cont);
        }
        insert contacts;
    }
}