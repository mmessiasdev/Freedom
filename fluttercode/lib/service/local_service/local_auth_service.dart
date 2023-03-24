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

  Future storeUser(User user) async{
    var response = json.encode(user.toJson());
    await _storage.write(key: "user", value: response);
  }
  
  Future<User> getSecureUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString("user");
    print(jsonUser);
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    User user = User.fromJson(mapUser);
    return user;
  }
 




  // ------------------------------------------------------

  Box<String>? _tokenBox;
  Box<User>? _userBox;

  // Future<void> init() async {
  //   _tokenBox = await Hive.openBox<String>('token');
  //   _userBox = await Hive.openBox<User>('user');
  // }

  // Future<void> addToken({required String token}) async {
  //   await _tokenBox?.put('token', token);
  //   print(token);
  // }

  Future<void> addUser({required User user}) async {
    await _userBox?.put('user', user);
    print(user);
  }

  // Future<void> clear() async {
  //   await _tokenBox?.clear();
  //   await _userBox?.clear();
  // }

  String? getToken() => _tokenBox?.get('token');
  User? getUser() => _userBox?.get('user');
}
