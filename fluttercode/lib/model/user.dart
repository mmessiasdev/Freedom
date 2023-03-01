import 'dart:convert';

import 'package:hive/hive.dart';

part 'user.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

@HiveType(typeId: 1)
class User extends HiveObject{
  @HiveField(0)
  String id;
  @HiveField(1)
  String fullName;
  @HiveField(2)
  String email;
  @HiveField(3)
  String? image;

  User({required this.id,required this.fullName,required this.email,this.image});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'].toString(),
      fullName: data['fullName'].toString(),
      email: data['email'],
      image: data['image'] == null ? null : data['image']['url'],
  );
}


// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReagentModelAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
        id: fields[0] as String,
        fullName: fields[1] as String,
        email: fields[2] as String,
        image: fields[3] as String,
        );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReagentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}