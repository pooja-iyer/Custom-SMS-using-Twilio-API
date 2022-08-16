/***************************************************************
 * Class: AccountHandler
 * Description: Handler class for trigger which implements the ITriggerHandler interface
 * Author-Bhuvaneshwari R
 * ***********************************************************/
public class AccountHandler implements ITriggerHandler{
    
    public Boolean isDisabled(){
        return false;
    }
    
    public void BeforeInsert(List<SObject> newItems){
        
    }
    
    public void BeforeUpdate(Map<id,SObject> newItems, Map<Id,SObject> oldItems){
        
    }
    
    public void BeforeDelete(Map<Id, SObject> oldItems){
        
    }
    
    public void afterInsert(Map<Id, SObject> newItems) {
	
    }
    
    public void afterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        AccountTriggerClass.callTwilioAPI(newItems,oldItems);
    }
    
    public void afterDelete(Map<Id, SObject> oldItems) {
    
    }
    
    public void afterUndelete(Map<Id, SObject> oldItems) {
    
    }

}