import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user.dart';

class LocalAuthService {
  final _storage = FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  Future<String?> getSecureToken(String token) async {
    return await _storage.read(key: "token");
  } 

  Future storeEmail(
      {required String email,
      required String full,
      // required String cel,
      // required String date,
      required String id}) async {
    await _storage.write(key: "id", value: id);
    await _storage.write(key: "email", value: email);
    await _storage.write(key: "full", value: full);
    // await _storage.write(key: "cel", value: cel);
    // await _storage.write(key: "date", value: date);
  }

  Future<String?> getEmail(String unicKey) async {
    return await _storage.read(key: "email");
  }

  Future<String?> getId(String unicKey) async {
    return await _storage.read(key: "id");
  }

  Future<String?> getFull(String unicKey) async {
    return await _storage.read(key: "full");
  }

  // Future storeFullname(String text) async {
  //   await _storage.write(key: "full", value: text);
  // }

  // Future storeId(String text) async {
  //   await _storage.write(key: "id", value: text);
  // }

  // Future storeDate(String text) async {
  //   await _storage.write(key: "date", value: text);
  // }

  // Future storeCel(String text) async {
  //   await _storage.write(key: "cel", value: text);
  // }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
  // ------------------------------------------------------

  // Box<String>? _tokenBox;
  // Box<User>? _userBox;

  // Future<void> init() async {
  //   _tokenBox = await Hive.openBox<String>('token');
  //   _userBox = await Hive.openBox<User>('user');
  // }

  // Future<void> addToken({required String token}) async {
  //   await _tokenBox?.put('token', token);
  //   print(token);
  // }

  // Future<void> addUser({required User user}) async {
  //   await _userBox?.put('user', user);
  //   print(user);
  // }

  // Future<void> clear() async {
  //   await _tokenBox?.clear();
  //   await _userBox?.clear();
  // }

  // String? getToken() => _tokenBox?.get('token');
  // User? getUser() => _userBox?.get('user');
}
