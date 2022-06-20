public with sharing class RequestVO {
    @auraEnabled public CandidateVO candidate  {get;set;}
    @auraEnabled public RequestInfoVO requestInfo {get;set;}
    
    // Test covered by RequestService.getPetsSerchedTest
    public RequestVO( Request__c request) {  
        this.candidate =  new CandidateVO(request.Candidate__r.Name, request.Candidate__r.MailingState); 
        this.requestInfo = new  RequestInfoVO(request);

    }

    public class RequestInfoVO{

        @auraEnabled public Boolean forFlat {get;set;}
        @auraEnabled public String petSize {get;set;}
        @auraEnabled public String petType {get;set;}
        @auraEnabled public double minAge {get;set;}
        @auraEnabled public Double maxAge {get;set;}

        // Test covered by RequestService.getPetsSerchedTest
        public requestInfoVO(Request__c request){
            this.forFlat = request.ForFlat__c;
            this.petSize =  request.PetSize__c;
            this.petType =  request.PetType__c;
            this.minAge = request.MinAge__c;
            this.maxAge = request.MaxAge__c;
        
        }

    }

    public class CandidateVO{
        @auraEnabled public String name {get;set;}
        @auraEnabled public String state {get;set;}
        
        // Test covered by RequestService.getPetsSerchedTest
        public CandidateVO (String name, String State){
            this.name = name;
            this.state = state;
        }
    }
}