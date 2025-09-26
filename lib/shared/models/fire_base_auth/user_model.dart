class UserModel {
  String id;
  String userName;
  String email;
  String phone;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
    'email': email,
    'phone': phone,
  };

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json['id'],
    userName: json['userName'],
    email: json['email'],
    phone: json['phone'],
  );
}
