/***********************************************************
 * Class: MockTwilioAPIResponse
 * Description : test class for Mock Twilio API. 
 * Created on: 15-August-2022
 * Author: Bhuvaneshwari R
 * *********************************************************/
@isTest
global class MockTwilioAPIResponse implements HttpCalloutMock{
    
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Accept', 'application/json');
        response.setStatusCode(201);
        return response;
    }

}