Trigger UpdateAccountFromRival on Account(before update){
Set<ID> AccountSet = new Set<ID>();
Map<ID,Decimal> TotalCountMap = new Map<ID,Decimal>();
Map<ID,Decimal> TotalAmountCountMap = new Map<ID,Decimal>();
for (Account A: Trigger.new){
AccountSet.add(A.ID);
}

for (AggregateResult result : [Select Count(id), Account__c from Rival1__c where Account__c IN: AccountSet group by Account__c]){
TotalCountMap.put((ID) result.get('Account__c'), (Decimal) result.get('expr0'));
}

for (AggregateResult result : [Select sum(Amount__c), Account__c from Rival1__c where Account__c IN: AccountSet group by Account__c]){
TotalAmountCountMap.put((ID) result.get('Account__c'), (Decimal) result.get('expr0'));
}

for (Account A: Trigger.new){
A.No_of_Rival1__c = TotalCountMap.get(A.id);
A.Total_Amount_of_Rival1__c = TotalAmountCountMap.get(A.id);

}}