Trigger BatchMethodOnContact on Contact (before update){

ID batchProcessID = Database.ExecuteBatch(new contactBatch());


}