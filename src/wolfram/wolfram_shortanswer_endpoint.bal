import ballerina/http;
import ballerina/encoding;
 
final string WOLFRAM_DOMAIN = "http://api.wolframalpha.com";

public type Client client object {

    string appID;
    http:Client wolframClient;

    public function __init(WolframConfiguration wolframConfig) {    
        self.wolframClient = new(WOLFRAM_DOMAIN);
        self.appID = wolframConfig.appID;
    }

    public remote function getWolframSAResponse(string question) returns string|error {
        string wolframAPIQuestion = string `/v1/result?appid=${check self.urle(self.appID)}&i=${check self.urle(question)}%3f`; 
        http:Response httpResult = check self.wolframClient->get(wolframAPIQuestion);
        return <@untainted> check httpResult.getTextPayload();
    }

    private function urle(string question) returns string|error {
        return check encoding:encodeUriComponent(question, "UTF-8");
    }

};

public type WolframConfiguration record {
    string appID = "";
};