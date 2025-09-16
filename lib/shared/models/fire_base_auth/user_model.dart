class UserModel {
  String id;
  String userName;
  String email;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
    'email': email,
  };

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json['id'],
    userName: json['userName'],
    email: json['email'],
  );
}
