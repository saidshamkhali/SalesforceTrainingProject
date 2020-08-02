trigger CreateAccountLead on Lead(after insert, after update){
      if (Trigger.isInsert){
            List<Account> accs= new List<Account>();
            for(Lead ld:Trigger.New){
                  Account a = new Account(Name = ld.LastName);
                  accs.add(a);
            }
            insert accs;
      }
}