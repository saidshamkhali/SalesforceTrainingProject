trigger LeadKeyFieldsPopulated on Lead (before insert) {
    for (Lead ld : Trigger.new) {
        if (ld.Bypass_Triggers__c == false) {
            List<String> fields = new List<String>();
            List<String> fieldsWithTest = new List<String>();
            Integer KeyNumber = 0;
            if (ld.FirstName != null) {KeyNumber++; fields.add('FirstName'); if(ld.FirstName.toUpperCase() == 'TEST') fieldsWithTest.add('FirstName');}
            if (ld.LastName != null) {KeyNumber++; fields.add('LastName'); if(ld.LastName.toUpperCase() == 'TEST') fieldsWithTest.add('LastName');}
            if (ld.Email != null) {KeyNumber++; fields.add('Email'); if(ld.Email.toUpperCase() == 'TEST') fieldsWithTest.add('Email');}
            if (ld.Phone != null) {KeyNumber++; fields.add('Phone'); if(ld.Phone.toUpperCase() == 'TEST') fieldsWithTest.add('Phone');}
            if (ld.Website != null) {KeyNumber++; fields.add('Website'); if(ld.Website.toUpperCase() == 'TEST') fieldsWithTest.add('Website');}
            if (ld.Title != null) {KeyNumber++; fields.add('Title'); if(ld.Title.toUpperCase() == 'TEST') fieldsWithTest.add('Title');}
            ld.Key_Fields_Populated__c = KeyNumber;

            if (KeyNumber >= 3){
                List<Task> task = new List<Task>();
                for (Integer i = 0; i < fields.size(); i++) {
                    Task tk = new Task();
                    tk.Subject = 'Verify the ' + fields[i] +' field';
                    tk.Status = 'Open';
                    tk.Priority = 'Normal';
                    tk.WhatId = ld.Id;
                    tk.OwnerId = ld.OwnerId;
                    task.add(tk);
                }
                if (fieldsWithTest.size() > 0) {
                    Task tk = new Task();
                    tk.Subject = 'WARNING';
                    tk.Status = 'Open';
                    tk.Priority = 'Normal';
                    tk.WhatId = ld.Id;
                    tk.OwnerId = ld.OwnerId;
                    tk.Description = 'This Lead contains the TEST keyword in the following key fields: ';
                    for (Integer j = 0; j < fieldsWithTest.size(); j++) {
                        if (j == fieldsWithTest.size()-1) tk.Description += fieldsWithTest[j] + '.';
                        else tk.Description += fieldsWithTest[j] + ', ';
                    }
                    task.add(tk);
                }
                insert task;
            }
        }
    }
}