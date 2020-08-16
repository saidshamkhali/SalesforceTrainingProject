public class AccountHandler {
    public static Account insertNewAccount(String name) {
        try {
            Account res = new Account(Name = name);
            System.debug(res);
            insert res;
            return res;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                        e.getMessage());
            return null;
        }
    }
}
