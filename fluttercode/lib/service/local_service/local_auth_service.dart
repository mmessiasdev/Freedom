import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import '../../model/user.dart';

class LocalAuthService {
  final _storage = FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await _storage.write(key: "token", value: token);
  }
    Future<void> storeUser(String user) async {
    await _storage.write(key: "user", value: user);
  }

  Future<String?> getSecureToken(String token) async {
    return await _storage.read(key: "token");
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
