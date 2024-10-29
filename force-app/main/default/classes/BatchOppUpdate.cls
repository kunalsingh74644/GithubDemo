//Write a batch class to update the 'Status' field of all 'Opportunity' records with 'Closed Won' if the stage is 'Closed - Won'.

public class BatchOppUpdate implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query='SELECT Id, StageName FROM Opportunity WHERE StageName = "Closed - Won" ';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<sObject> scope){
        
    }
    public void finish(Database.BatchableContext BC){
        
    }

}