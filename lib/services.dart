import 'package:http/http.dart' as http;

String url = 'http://localhost:60000/';

String fetchPost() {
  var response= http.get('https://jsonplaceholder.typicode.com/posts/1');
  print(response);
  return response.toString();
}
