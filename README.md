# Wolfram Alpha API Interface
For now this module only implments the [short answer API](http://products.wolframalpha.com/short-answers-api/documentation/).

Here is an example of how you can use this module to create a command line interface to Wolfram Alpha.
```
import jamiecurtis/wolfram;
import ballerina/io;
import ballerina/config;

public function main() {
    // I have exported WAPP_ID in my ~/.bashrc file which contains the 
    // Wolfram Application ID
    wolfram:WolframConfiguration wolframConf = { appID: config:getAsString("WAPP_ID") };
    wolfram:Client wolframClient = new(wolframConf);
    while (true) {
        string userQuestion = io:readln("Ask Wolfram Alpha a question: ");
        // Get a short asnwer from the wolfram client
        string|error wolframsAnswer = wolframClient->getWolframSAResponse(userQuestion);
        io:println(wolframsAnswer, "\n");
    }
}
```
