class Post {
  final String username;
  final String password;
  final String language;
  final String isPersistent;

  Post({this.username, this.password, this.language, this.isPersistent});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      username: json['username'],
      password: json['password'],
      language: json['language'],
      isPersistent: json['isPersistent'],
    );
  }
}