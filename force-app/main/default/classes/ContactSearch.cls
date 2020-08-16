public class ContactSearch {
    public static List<Contact> SearchForContacts(String name, String postalCode) {
        List<Contact> ct = new List<Contact>([SELECT Id, Name FROM Contact WHERE LastName = :name AND MailingPostalCode = :postalCode]);
        return ct;
    }
}
