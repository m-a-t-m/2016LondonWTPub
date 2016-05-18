public class ChatterCanvasSignedRequestController {

    public String signedRequest { get; set; }
    public String jsonEnvelope { get; set; }
    
public ChatterCanvasSignedRequestController() {
    this.signedRequest = ApexPages.currentPage().getParameters().get('signed_request');

    if(!String.isBlank(this.signedRequest)) {
        string[] signedRequestLst = signedRequest.Split('\\.');
        System.assertEquals(2, signedRequestLst.size());

        // The hashed Based64 context signed with the consumer secret
        string encodedSig = signedRequestLst[0];
        Blob decodedSig = EncodingUtil.base64Decode(encodedSig);

        // The context and authorization token JSON encoded in Base64
        String encodedEnvelope = signedRequestLst[1];
        this.jsonEnvelope = EncodingUtil.base64Decode(encodedEnvelope).ToString();

        // Continue decoding - to be completed. 
        // Currently this is not secured.
        // http://www.salesforce.com/us/developer/docs/platform_connectpre/Content/canvas_app_unsigning_code_example.htm

        // Use the HMAC SHA-256 algorithm to hash the Base64 encoded context and sign it using your consumer secret.
        Blob encodedEnvelopeHash = Crypto.generateDigest('SHA-256', Blob.valueOf(encodedEnvelope));
        // How do you sign this with the consumer secret using SHA-256?
        //Crypto.sign('SHA256', encodedEnvelopeHash, EncodingUtil.base64Decode(consumerSecret));

        //TODO: Throw an exception here if the hashes don't match. Tampered request.

        // Read the Session details and other useful information
        JSONParser parser = JSON.createParser(this.jsonEnvelope);
    }
}
}