import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import '../../model/user.dart';

Future<User> getSavedUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonUser = prefs.getString("tokenSaved").toString();
  print(jsonUser);

  Map<String, dynamic> mapUser = json.decode(jsonUser);
  User user = User.fromJson(mapUser);
  return user;
}

class LocalAuthService {
  Box<String>? _tokenBox;
  Box<User>? _userBox;

  Future<void> init() async {
    _tokenBox = await Hive.openBox<String>('token');
    _userBox = await Hive.openBox<User>('user');
  }

  Future<void> addToken({required String token}) async {
    await _tokenBox?.put('token', token);
    print(token);
  }

  Future<void> addUser({required User user}) async {
    await _userBox?.put('user', user);
    print(user);
  }

  Future<void> clear() async {
    await _tokenBox?.clear();
    await _userBox?.clear();
  }

  String? getToken() => _tokenBox?.get('token');
  User? getUser() => _userBox?.get('user');
}







