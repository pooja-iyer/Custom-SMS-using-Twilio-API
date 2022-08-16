/***************************************************************
 * Class: TwilioAPIApex
 * Description: Code to call the twilio api and send sms to the phone number specified.
 * Created on - 14.August.2022
 * Author-Bhuvaneshwari R
 * ***********************************************************/

public class TwilioAPIApex {
    
    @future (callout=true)
    public static void TwilioAPICallout(String smsBody, String phoneNum){
        String status = sendSMSTwilio(smsBody,phoneNum);
    }
    
    @AuraEnabled
    public static String sendSMSTwilio(String smsBody, String phoneNum){
        
        //fetching values from the twilio creds
        List<Twilio_Creds__c> customCreds = Twilio_Creds__c.getall().values();
        //specifying end point
        String endPoint = APICalloutsUtility.NAMEDCREDENTIAL_TWILIOSERVICE+customCreds[0].AccountSID__c+'/SMS/Messages.json';
        // adding body 
        String reqBody ='To='+EncodingUtil.urlEncode(phoneNum, 'UTF-8')+'&From='+EncodingUtil.urlEncode(customCreds[0].fromPhone__c,'UTF-8')+'&Body='+smsBody;
        
        HttpRequest request = new HttpRequest();
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        
        request.setEndpoint(endPoint);
        request.setHeader(APICalloutsUtility.ACCEPTTYPE, APICalloutsUtility.CONTENTTYPE_JSON);
        request.setMethod('POST');
        request.setBody(reqBody);
        request.setTimeout(APICalloutsUtility.MAX_TIMEOUT);
        response = http.send(request);
 
       if(response.getStatusCode() == 201){
           return response.getStatus();
       	} 
        else{
            return response.getStatus();
       }
    }

}