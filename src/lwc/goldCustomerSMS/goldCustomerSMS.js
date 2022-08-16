import { LightningElement, api, wire } from 'lwc';
import sendSMSTwilio from "@salesforce/apex/TwilioAPIApex.sendSMSTwilio";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord } from 'lightning/uiRecordApi';

export default class GoldCustomerSMS extends LightningElement {
    smsBody='';
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Phone']})
    customerContact;

    sendSMS(){
        let smsBody = this.template.querySelector('lightning-textarea').value;
        sendSMSTwilio({smsBody: smsBody, phoneNum: this.customerContact.data.fields.Phone.value})
        .then(result => {
            const event = new ShowToastEvent({
                title: 'SMS Sent!!',
                message: 'SMS has been sent to the Customer!',
                variant: 'success',
            });
            this.dispatchEvent(event);
        }).catch(error => {
            const event = new ShowToastEvent({
                title: 'SMS Not Sent!',
                message: 'SMS has not been delivered to the Customer due to some unexpected error!',
                variant: 'error',
            });
            this.dispatchEvent(event);
         });
    }

}