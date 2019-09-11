import ballerina/test;
import ballerina/config;
import ballerina/io;

# Test function

WolframConfiguration conf = {
    appID: config:getAsString("WAPP_ID")
};

@test:Config { }
function testFunction() returns error? {
    Client wcl = new(conf);
    string result = check wcl->getWolframSAResponse("how are you");
    io:println(result);
}
