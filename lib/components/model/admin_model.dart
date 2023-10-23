
// @HiveType(typeId: 1)
class Admin {
  // @HiveField(0)
  final String username;
  //  @HiveField(1)
  final String password;
  //  @HiveField(2)
  final String profilePhoto;

  Admin({
    required this.username,
    required this.password,
    required this.profilePhoto,
  });
}
