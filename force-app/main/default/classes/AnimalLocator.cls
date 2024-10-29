public class AnimalLocator {
    public static String getAnimalNameById(Integer intId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();       
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + intId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            Map<String, Object> results = ((Map<String, Object>)
                                           JSON.deserializeUntyped(response.getBody()));
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            String name = (String) animal.get('name');
            return(name);
        }
        return('error');
    }
}