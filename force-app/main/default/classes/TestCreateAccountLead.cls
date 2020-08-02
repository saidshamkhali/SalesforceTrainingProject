@isTest
public class TestCreateAccountLead { 
    static testMethod void Accountcreate() {
		Lead l = new Lead(Company = 'Test Lead',
                          LastName = 'Lead Last Name');
        insert l;
    }
}