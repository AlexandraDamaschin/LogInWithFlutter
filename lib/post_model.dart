import 'dart:convert';

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<Post> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}

String allPostsToJson(List<Post> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Post {
  String username;
  String password;
  String language;
  String isSomething;
  String body;

  Post({
    this.username,
    this.password,
    this.language,
    this.isSomething,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => new Post(
    username: json["userName"],
    password: json["password"],
    language: json["language"],
    isSomething: json["isSomething"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userName": username,
    "password": password,
    "language": language,
    "isSomething": isSomething,
    "body": body,
  };
}