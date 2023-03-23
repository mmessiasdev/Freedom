import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:Freedom/service/local_service/local_auth_service.dart';
import 'package:Freedom/service/remote_service/remote_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final LocalAuthService _localAuthService = LocalAuthService();

  @override
  void onInit() async {
    await _localAuthService.init();
    super.onInit();
  }

  void signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signUp(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService()
            .createProfile(fullName: fullName, token: token);
        if (userResult.statusCode == 200) {
          print(user.value);
          user.value = userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Bem vindo ao Freedom.");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
        }
      } else {
        EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
      }
    } catch (e) {
      EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );
      // User savedUser = await getSavedUser();
      // print(savedUser);

      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          await RemoteAuthService().storeToken(token);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Bem vindo ao Freedom");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
        }
      } else {
        EasyLoading.showError('Email ou senha incorreto.');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void posting({required String content}) async {
    await _localAuthService.init();
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var token = await RemoteAuthService().getToken("token"); 
      print("Token: ${token}");
      var userResult = await RemoteAuthService().addPost(
          token: token.toString(), content: content);
      if (userResult.statusCode == 200) {
        EasyLoading.showSuccess(
            "Seu relato foi enviado para aprovação. Dentro de alguens minutos ele estará disponível.");
        Navigator.of(Get.overlayContext!).pop();
      } else {
        EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
      }
    } catch (e) {
      print(e);
      EasyLoading.showError('Alguma coisa deu errado.');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    await _localAuthService.clear();
  }
}
