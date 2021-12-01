/*
 * this simple example retrieves JSON data from the MBTA server
 * using version 3 of the api (documented in https://api-v3.mbta.com/docs)
 */

import 'dart:io';
import 'dart:convert';


// this uri must be kept in sync with the current MBTA API
// requests a json formatted list of subway lines (the filter specifies light rail)
const routes = 'https://api-v3.mbta.com/routes?filter[type]=0,1';

// traverse a list and print items
void showRoutes(List result) {
    for (String item in result) {
	print('$item');
    }
}


void main() async {
    var uri = Uri.parse("$routes");

    // use HttpClient class to connect
    var httpClient = HttpClient();
    print('about to connect to $routes');
    // open connection, send request and wait for response
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var rawResult = await utf8.decoder.bind(response).toList();
/*
    print('response was ${response.statusCode}');
*/
    showRoutes(rawResult);
    // cleanup by closing the connection
    httpClient.close();
}
