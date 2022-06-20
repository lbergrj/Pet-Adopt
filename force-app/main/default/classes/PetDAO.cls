public with sharing class PetDAO {
   
    public static List<Pet__c> getPetsRequested(Request__c request){

        System.debug('Request PetType: ' + request.PetType__c);
        System.debug('Request PetSize: ' + request.PetSize__c);
        System.debug('Request State: ' + request.State__c);
        System.debug('Request MinAge: ' + request.MinAge__c);
        System.debug('Request MaxAge: ' + request.MaxAge__c);


       return [  SELECT Id, Name, PetType__c, PetSize__c, ForFlat__c, Age__c, State__c,
                    Contact__c, Contact__r.Name, Contact__r.MailingState                        
                FROM Pet__c
                WHERE PetType__c = :request.PetType__c AND PetSize__c = :request.PetSize__c 
                    AND State__c = :request.State__c 
                    AND Age__c <= :request.MaxAge__c AND Age__c >= :request.MinAge__c 
        ];
     
    }

   
}