import 'dart:convert';

import 'package:hive/hive.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

@HiveType(typeId: 4)
class User {
  @HiveField(0)
  String id;
  @HiveField(1)
  String fullName;
  @HiveField(2)
  String email;
  @HiveField(3)
  String? image;
  @HiveField(4)
  String age;

  User({required this.id,required this.fullName,required this.email,this.image,required this.age});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'].toString(),
      fullName: data['fullName'],
      email: data['email'],
         age: data['age'],
      image: data['image'] == null ? null : data['image']['url'],
   
  );
}