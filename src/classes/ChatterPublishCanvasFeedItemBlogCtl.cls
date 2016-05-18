public with sharing class ChatterPublishCanvasFeedItemBlogCtl {
    public String title { get; set;}
    public String vidId { get; set;}
    public String comment { get; set;}

    public ChatterPublishCanvasFeedItemBlogCtl() {
    vidId = 'The Id';
    title = 'The title';
    comment = 'The comment';
    }
    
    public PageReference doPost() {
    
        system.debug('NEW CANVAS FEED ITEM POST');
        ChatterCreateCanvasFeedItemBlog.postToFeed(vidId, title, comment);

        return null;
    }
}