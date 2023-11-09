/**
 * *This class creates sample contacts
 */
public class RandomContactFactory {
    /**
     * * This method creates sample contacts
     * @param numContacts The parameter where you input the number of contact that you want
     * @param lastName The paramater where you input the last name that you want the contacts to have
     */
    public static List<Contact> generateRandomContacts (Integer numContacts, String lastName){
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0;i<numContacts;i++) {
            Contact c = new Contact(FirstName='Test' + i,
                                   LastName = lastName);
            contacts.add(c);
        }
        return contacts;
    }

}