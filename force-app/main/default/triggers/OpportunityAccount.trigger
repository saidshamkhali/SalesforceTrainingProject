trigger OpportunityAccount on Account (after insert) {
    //Trigger that creates 10 identical Opportunities whenever an Account with more than 99 employees is created.
    Integer numberEmployees;
    List<Opportunity> opList = new List<Opportunity>();
    for (Account currAccount : Trigger.New) {
        numberEmployees = currAccount.NumberOfEmployees;
        if (numberEmployees > 99){
            for (integer i = 0; i<10;i++) {
                Opportunity op = new Opportunity();
                op.AccountId = currAccount.Id;
                op.Name = currAccount.Name;
                op.CloseDate = Date.today();
                op.StageName = 'Prospecting';
                opList.add(op);
            }
            insert opList;
        }
    }
}