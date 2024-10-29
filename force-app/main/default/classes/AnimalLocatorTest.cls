@isTest
public class AnimalLocatorTest {
    
    public class AnimalLocatorMock implements HttpCalloutMock {
        // This is the response that is sent back from the mock callout
        public HTTPResponse respond(HTTPRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            
            if (request.getEndpoint().contains('animals/1')) {
                response.setBody('{"animal": {"name": "Lion"}}');
                response.setStatusCode(200);
            } else if (request.getEndpoint().contains('animals/999')) {
                response.setBody('{"error": "Not Found"}');
                response.setStatusCode(404);
            }
            
            return response;
        }
    }

    @isTest static void testGetAnimalNameById_Success() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String animalName = AnimalLocator.getAnimalNameById(1);
    }
    
    @isTest static void testGetAnimalNameById_Error() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String animalName = AnimalLocator.getAnimalNameById(999);        
    }
}