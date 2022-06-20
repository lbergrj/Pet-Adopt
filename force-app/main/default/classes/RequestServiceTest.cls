@isTest
public with sharing class RequestServiceTest {
   
    
    @isTest
    public static void getPetsSerchedTest(){
       List<Contact> contacts = new List<Contact>();

       Id recordTypeCandidate = Utils.getRecordTypeId('Contact', 'Candidate');
       Id recordTypeGiver = Utils.getRecordTypeId('Contact', 'Giver');
       Request__c request;
       Pet__c pet; 

       //Criação de contatos
	   contacts.add( new Contact(RecordTypeId = recordTypeCandidate, FirstName = 'João', LastName = 'Silva', MailingState = 'SP'));        
       contacts.add(new Contact(RecordTypeId = recordTypeGiver, FirstName = 'Maria', LastName = 'Silva', MailingState = 'SP')); 
       insert contacts;
       
       //Criação dos registros de Pet e Requisição
        for (Contact c: contacts){
            if(c.RecordTypeId == recordTypeCandidate){
                //Criação do registro de requisição
                 request = new Request__c(Candidate__c = c.Id, MinAge__c = 1, MaxAge__c = 4, 
                 				ForFlat__c = false, PetType__c = 'Gato', PetSize__c = 'Middle', Status__c = 'Active');
               
            }
            if(c.RecordTypeId == recordTypeGiver){
                //Criação do registro de pet
                pet = new Pet__c(Contact__c = c.Id,  Age__c = 2, ForFlat__c = false, PetType__c = 'Gato',
                 				PetSize__c = 'Middle', Name = 'Gato de Teste');
                
            }
        }
        insert request;
        insert pet;
        
        Test.startTest();

        String data = RequestService.getPetsSerched(request.Id);
        
        Test.stopTest(); 
        
        Map<String, Object> m =  (Map<String, Object>) JSON.deserializeUntyped(data);        
        Integer quantidy = (Integer) m.get('quantidy');
        System.debug('Map ' + m);
        System.debug('Quantidy ' + quantidy);
        System.assertEquals(1, quantidy,'Resultado não esperado');
          
        
    }
}