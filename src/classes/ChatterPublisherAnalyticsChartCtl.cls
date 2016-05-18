public class ChatterPublisherAnalyticsChartCtl {

    @auraEnabled
    public static List<ChatterCurrentActivity__c> runReport() {
        return [SELECT Posts__c, Comments__c, Likes__c, LastUpdate__c from ChatterCurrentActivity__c WHERE Name = 'Global' LIMIT 1];

    }
}