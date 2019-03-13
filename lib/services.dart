import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:login_app/post_model.dart';
import 'dart:io';

String url = 'http://localhost:60000/';

Future<http.Response> fetchPost() {
  return http.get('https://jsonplaceholder.typicode.com/posts/1');
}

Future<http.Response> createPost(Post post) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: postToJson(post)
  );
  return response;
}
