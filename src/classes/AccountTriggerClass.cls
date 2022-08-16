/***************************************************************
 * Class: AccountTriggerClass
 * Description: Code for Account trigger class
 * Created on - 14.August.2022
 * Author-Bhuvaneshwari R
 * ***********************************************************/

public class AccountTriggerClass {
    
    // function to make the call from trigger to twilio api based on criteria check.
    public static void callTwilioAPI(Map<Id,SObject> newItems, Map<Id,SObject> oldItems){
        List<Account> newAccountList = newItems.values();
        //fecthing values of CEO from custom settings
        list<CEO_info__c> ceoUser = CEO_info__c.getall().values();
        for(Account newAcc: newAccountList){
            Account oldAcc = (Account)oldItems.get(newAcc.Id);
            //check for first time GOLD customer and send sms to ceo
            if(newAcc.Customer_classification__c=='GOLD' && oldAcc.Customer_classification__c!='GOLD'){
                //call api with sms body mentioned
                String smsBody = 'Great News! A Customer has hit Gold.'+newAcc.Name+' will get VIP treatment';
                TwilioAPIApex.TwilioAPICallout(smsBody,ceoUser[0].PhoneNumber__c);
            }
        }
    }

}