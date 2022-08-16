/***********************************************************
 * Class: Test_TwilioAPIApex
 * Description : test class for Twilio API. Creation of account and Opportunity to test the trigger and sms sending
 * Mock class: MockTwilioAPIResponse
 * Created on: 15-August-2022
 * Author: Bhuvaneshwari R
 * *********************************************************/
@isTest
public class Test_TwilioAPIApex {
    
    @isTest
    public static void testTwilioCallout(){
        
        //test start
        Test.setMock(HttpCalloutMock.class, new MockTwilioAPIResponse());
        Test.startTest();
        
        //creation of test account
        Account acc = new Account();
        acc.Name='test account';
        acc.SLA__c='Bronze';
        acc.SLAExpirationDate__c=System.today();
        acc.SLASerialNumber__c='123';
        acc.OwnerId=UserInfo.getUserId();
        insert acc;
        
        System.assert(acc.Id!=Null);
        
        //creation of test custom setting - CEO_info
        CEO_info__c info = new CEO_info__c();
        info.Name='test';
        info.PhoneNumber__c='0123456789';
        insert info;
        
        //creation of test custom setting - Twilio_Creds
        Twilio_Creds__c twilioCreds = new Twilio_Creds__c();
        twilioCreds.Name='test';
        twilioCreds.AccountSID__c='0123456789';
        twilioCreds.fromPhone__c='0123456789';
        insert twilioCreds;
        
        //creating test opportunity
        Opportunity opp = new Opportunity();
        opp.Name='test opp';
        opp.AccountId=acc.Id;
        opp.Amount=50000;
        opp.StageName='Closed Won';
        opp.CloseDate=system.today();
        insert opp;
        
        System.assert(opp.Id!=Null);
        
        Test.stopTest();
        
        
        
        
    }

}