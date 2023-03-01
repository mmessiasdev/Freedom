import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Freedom/component/header.dart';
import 'package:Freedom/controller/controllers.dart';

import '../../component/colors.dart';
import 'auth/sign_in_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const MainHeader(),
        Obx(
          () => Container(
            color: BackgroundOffColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Color.fromRGBO(112, 53, 64, 1),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        authController.user.value?.fullName ??
                            "Sign in your account",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(146, 146, 146, 1)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        buildAccountCard(title: "Sobre Nós", onClick: () {}),
        buildAccountCard(title: "Termos e serviços", onClick: () {}),
        Obx(() => buildAccountCard(
            title:
                authController.user.value == null ? "Entrar" : "Sair da conta",
            onClick: () {
              if (authController.user.value != null) {
                authController.signOut();
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              }
            }))
      ],
    );
  }

  Widget buildAccountCard(
      {required String title, required Function() onClick}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
