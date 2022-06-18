public with sharing class RequestDAO {
    
    public static Request__c getRequestById(Id requestId){
        return [Select Id, Name,  ForFlat__c, MaxAge__c, MinAge__c, PetSize__c, PetType__c, Status__c, State__c,
                        Candidate__c, Candidate__r.Name, Candidate__r.MailingState, Candidate__r.MailingCity,  Candidate__r.MailingStreet,
                        Candidate__r.Phone,  Candidate__r.MobilePhone, Candidate__r.Email
                    FROM Request__c
                    WHERE Id =  :requestId
                    LIMIT 1
                ];
    }
}