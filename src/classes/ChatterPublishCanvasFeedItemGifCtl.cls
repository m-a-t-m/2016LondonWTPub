public with sharing class ChatterPublishCanvasFeedItemGifCtl {
    public String title { get; set;}
    public String vidId { get; set;}
    public String comment { get; set;}

    public ChatterPublishCanvasFeedItemGifCtl() {
    vidId = 'The Id';
    title = 'The title';
    comment = 'The comment';
    }
    
    public PageReference doPost() {
    
        system.debug('NEW CANVAS FEED ITEM POST');
        ChatterCreateCanvasFeedItemGif.postToFeed(vidId, title, comment);

        return null;
    }
}