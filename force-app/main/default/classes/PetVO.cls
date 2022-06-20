public with sharing class PetVO {

    String type;
    String size;
    String name;
    Boolean forFlat;
    Double age;
    GiverInformationVO giver;

    // Test covered by RequestService.getPetsSerchedTest
    public PetVO(Pet__c pet ){
        this.giver = new GiverInformationVO(pet.Contact__r.Name, pet.Contact__r.MailingState);
        this.type = pet.PetType__c;  
        this.size = pet.PetSize__c;
        this.name = pet.Name;            
        this.forFlat = pet.ForFlat__c;            
        this.age = pet.Age__c;
        this.giver = giver;
    }    

   
    private class GiverInformationVO {
        String state;
        String name;
        
        // Test covered by RequestService.getPetsSerchedTest
        GiverInformationVO(String name, String state ){
            this.name = name;
            this.state = state;
        }

    }

    
}