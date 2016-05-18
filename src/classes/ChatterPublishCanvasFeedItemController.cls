public with sharing class ChatterPublishCanvasFeedItemController {
    public String title { get; set;}
    public String vidId { get; set;}
    public String comment { get; set;}

    public ChatterPublishCanvasFeedItemController() {
    vidId = 'gif';
    title = 'gif';
    comment = 'gif';
    }
    
    public PageReference doPost() {
    
        system.debug('NEW CANVAS FEED ITEM POST');
        ChatterCreateCanvasFeedItem.postToFeed(vidId, title, comment);

        return null;
    }
}