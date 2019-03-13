import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:login_app/post_model.dart';
import 'dart:io';

String url = 'http://localhost:60000/';

Future<List<Post>> getAllPosts() async {
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJson(response.body);
}

Future<Post> getPost() async{
  final response = await http.get('$url/1');
  return postFromJson(response.body);
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
