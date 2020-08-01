trigger ContactHelloWorld on Contact (before insert) {
    for(Contact contact : Trigger.New) {
        contact.Email = 'hello@world.com';
    } 
}