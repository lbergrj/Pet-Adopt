public with sharing class SerchPetsService {

    @AuraEnabled
    public static string getPetsSerched(Id requestId){
        PetsFoundVO data ;
        try {
            //Busca das informacôes da Requisição
            Request__c request = RequestDAO.getRequestById(requestId);
            System.debug( 'RequestDAO : ' + request);
            
            if(request != null){                
                //Busca dos Pets Requisitados
                List<Pet__c> petsSearched = PetDAO.getPetsRequested(request);
                System.debug( 'PetDAO : ' + petsSearched);

                //Filtro               
                List<Pet__c> pets = new List<Pet__c>();
                for(Pet__c pet:petsSearched){
                    if(!request.ForFlat__c || (request.ForFlat__c && pet.ForFlat__c )){
                        pets.add(pet);
                    }
                }
                System.debug('Pets: ' + pets);

                // Formatar dados de saída
                data = new PetsFoundVO(request,pets);
                System.debug('Saida Formatada: ' + data);


            }

        } catch (Exception e) {
            data = new PetsFoundVO();
            throw new AuraHandledException(e.getMessage());
            
            
        }
        return JSON.serialize(data);
    }
    

    public class PetsFoundVO {
        @auraEnabled public RequestVO request {get; set;}
        @auraEnabled public Integer quantidy  {get; set;}
        @auraEnabled public List<PetVO> listPet {get; set;}
        @AuraEnabled public String  result {get; set;}
        @AuraEnabled public String  message {get; set;}

        public PetsFoundVO(){
            this.result = 'NOK';
        }
     
        public PetsFoundVO(Request__c request, List<Pet__c> pets) {
            this.listPet = new List<PetVO>();
            this.quantidy = 0;
            this.request = new  RequestVO(request);           
            this.result = 'OK';

            if(pets != null){
                this.quantidy = pets.size();
                for(Pet__C pet:pets){            
                    this.listPet.add(new PetVO(pet)); 
                }
            }
            
        }
    
    }
}
