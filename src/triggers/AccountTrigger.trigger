/***************************************************************
 * Class: AccountTrigger
 * Description: Single trigger for the Account object.
 * Author-Bhuvaneshwari R
 * ***********************************************************/
trigger AccountTrigger on Account (after insert, after update) {
    
    //trigger dispatcher
    TriggerDispatcher.Run(new AccountHandler());

}