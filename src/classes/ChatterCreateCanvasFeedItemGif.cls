public class ChatterCreateCanvasFeedItemGif{

    public ChatterCreateCanvasFeedItemGif(){
    }
    
    public static void postToFeed(String vidId , String title, String comment){

    ConnectApi.FeedItemInput input = new ConnectApi.FeedItemInput();
    input.feedElementType = ConnectApi.FeedElementType.FeedItem;
    input.subjectId = 'me';
     
    ConnectApi.TextSegmentInput textInput = new ConnectApi.TextSegmentInput();
    textInput.text = comment;
    
    ConnectApi.MessageSegmentInput messageInput = (ConnectApi.MessageSegmentInput)textInput;
    
    ConnectApi.MessageBodyInput body = new ConnectApi.MessageBodyInput();
    body.messageSegments = new List<ConnectApi.MessageSegmentInput>{messageInput};
    
    input.body = body;
    
    ConnectApi.CanvasCapabilityInput canvas = new ConnectApi.CanvasCapabilityInput();
    canvas.developerName = 'Chatter_Canvas_Feed_Item_Gif'; 
    canvas.namespacePrefix = '';//namespace added
    canvas.height = '240px';
    //canvas.parameters = '"dimensions":{"width": "420px","height": "236px","maxHeight": "400px","maxWidth": "420px"}';
    canvas.title = 'GIF';
    canvas.thumbnailurl = 'http://i.giphy.com/26BkNrGhy4DKnbD9u.gif';
    
    ConnectApi.FeedElementCapabilitiesInput capability = new ConnectApi.FeedElementCapabilitiesInput();
    capability.canvas = canvas;
    
    input.capabilities = capability;
    
    List<ConnectApi.BatchInput> feedElements = new List<ConnectApi.BatchInput>();
    ConnectApi.BatchInput element = new ConnectApi.BatchInput((object)input);
    system.debug('$$$$$$$ ADD ELEMENT $$$$$$$$$$');
    system.debug(element);
    feedElements.add(element);
    system.debug('++++++++++ ELEMENTS +++++++++++');  
    system.debug(feedelements);
    
    ConnectApi.BatchResult[] results = ConnectApi.ChatterFeeds.postFeedElementBatch('internal', feedElements);
    system.debug('++++++++++ RESULTS +++++++++++');  
    system.debug(results);
    }
}