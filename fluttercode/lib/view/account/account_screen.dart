import 'package:Freedom/component/texts.dart';
import 'package:Freedom/model/user.dart';
import 'package:Freedom/service/local_service/local_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Freedom/component/header.dart';
import 'package:Freedom/controller/controllers.dart';

import '../../component/buttomdefault.dart';
import '../../component/colors.dart';
import '../../component/infoinputlogin.dart';
import 'auth/sign_in_screen.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  

  Future<User> savedLogin(User user) async{
    User saveLogin = await LocalAuthService().getSecureUser();
    return saveLogin;
  }
    

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          MainHeader(),
          Obx(
            () => Container(
              color: BackgroundOffColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back_ios),
                      onTap: () {
                        Navigator.pop(
                          context,
                          // MaterialPageRoute(
                          //   builder: (context) => const SignInScreen(),
                          // ),
                        );
                      },
                    ),
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
                          authController.user.value == null
                              ? "Faça Login"
                              : authController.user.value!.fullName!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(146, 146, 146, 1),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          // buildAccountCard(title: "Sobre Nós", onClick: () {}),
          // buildAccountCard(title: "Termos e serviços", onClick: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Obx(
              () => Column(
                children: [
                  InfoInputLogin(
                    title: 'Nome: ${authController.user.value == null ? "" : authController.user.value?.fullName}',
                  ),
                  InfoInputLogin(
                    title: 'Email: ${authController.user.value == null ? "" : authController.user.value?.email}',
                  ),
                  InfoInputLogin(
                    title: 'Id: ${authController.user.value == null ? "" : authController.user.value?.id}',
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InputTextButton(
                title: authController.user.value == null
                    ? "Entrar"
                    : "Sair da conta",
                onClick: () {
                  if (authController.user.value != null) {
                    authController.signOut();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
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
              SubText(text: title, color: TerciaryColor, align: TextAlign.start)
            ],
          ),
        ),
      ),
    );
  }
}
