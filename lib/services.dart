import 'package:http/http.dart' as http;

String url = 'http://localhost:60000/';

Future<String> fetchPost() async{
  final response= await http.get('https://jsonplaceholder.typicode.com/todos/1');
  print(response);

  if (response.statusCode == 200) {
    print('RETURNING: ' + response.body);
    return response.body;
  } else {
    throw Exception('Failed to load post');
  }
}
