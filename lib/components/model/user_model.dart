// @HiveType(typeId: 1)
class UserModel {
  // @HiveField(0)
  String name;
  // @HiveField(1)
  String username;
  // @HiveField(2)
  String password;
  // @HiveField(3)
  String phoneNumber;
  // @HiveField(4)
  String profilePhoto;
  // @HiveField(4)
  List<Map<String, int>> cartItems = [];
  // @HiveField(4)
  List<String> favorites = [];

  UserModel(
      {required this.name,
      required this.username,
      required this.password,
      required this.phoneNumber,
      required this.profilePhoto});
}
