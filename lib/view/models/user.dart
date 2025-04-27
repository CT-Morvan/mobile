class User {
  final int? id;
  final String? name;
  final String? pictureUrl;
  final String? userName;
  final String? password;
  final bool? isAdmin;

  User({
    this.id,
    this.name,
    this.pictureUrl,
    this.userName,
    this.password,
    this.isAdmin = false,
  });
}
