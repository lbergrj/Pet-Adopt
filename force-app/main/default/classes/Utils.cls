public with sharing class Utils {

    // Test covered by RequestService.getPetsSerchedTest
    public static Id getRecordTypeId(String SObjectName, String recordTypeDeveloperName){       
        List<RecordType> types = [ SELECT Id from RecordType where  SobjectType = :SObjectName  and DeveloperName =: recordTypeDeveloperName];
        return types[0].Id;
    }
    
}