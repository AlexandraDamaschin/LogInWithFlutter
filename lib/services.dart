import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_app/post.dart';

Future<String> fetchPost(String name, String password,
    {String language: 'ro-RO'}) async {
  print(name + " " + password + " " + language);

  final response =
      await http.get('https://jsonplaceholder.typicode.com/todos/1');
  print(response);

  if (response.statusCode == 200) {
    print('RETURNING: ' + response.body);
    return response.body;
  } else {
    throw Exception('Failed to load post');
  }
}

Future<Post> createPost(String name, String password,
    {String language: 'ro-RO', String isPersistent: 'false'}) async {
  String url = 'http://192.168.88.10:60000/api/account';

  var body = json.encode({
    'username': name,
    'password': password,
    'language': language,
    'isPersistent': isPersistent
  });

  Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  }; //application/json; charset=UTF-8

  final response = await http.post(url, headers: headers, body: body);
  print(response.body);
  final responseJson = json.decode(response.body);
  print(responseJson);
    if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return Post.fromJson(json.decode(responseJson.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to make post');
  }
}
