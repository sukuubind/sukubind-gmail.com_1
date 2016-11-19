Trigger BatchMethodOnContact1 on Account (after update){

ID batchProcessID = Database.ExecuteBatch(new contactBatch());


}