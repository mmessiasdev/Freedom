import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User{
  String id;
  String fullName;
  String email;
  String? image;

  User({required this.id,required this.fullName,required this.email,this.image});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'].toString(),
      fullName: data['fullName'].toString(),
      email: data['email'],
      image: data['image'] == null ? null : data['image']['url'],
  );
}