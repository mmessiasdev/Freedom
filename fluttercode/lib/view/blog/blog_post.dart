import 'package:Freedom/component/colors.dart';
import 'package:Freedom/controller/auth_controller.dart';
import 'package:Freedom/controller/controllers.dart';
import 'package:Freedom/extention/string_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../component/buttomdefault.dart';
import '../../component/inputdefault.dart';
import '../../component/texts.dart';
import '../../service/remote_service/remote_auth_service.dart';

class ContainerPost extends StatelessWidget {
  ContainerPost();

  final _formKey = GlobalKey<FormState>();
  TextEditingController content = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    content.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListView(
              children: [
                Center(
                  child: SecundaryText(
                    text: 'Confirme seu email e sua senha.',
                    color: OffColor,
                    align: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InputTextField(
                    title: 'Email',
                    icon: Icon(Icons.email_rounded),
                    textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Esse campo não pode ficar vazio.";
                      } else if (!value.isValidEmail) {
                        return "Insira um email válido.";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Password',
                  obsecureText: true,
                  icon: Icon(Icons.lock),
                  textEditingController: passwordController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Esse campo não pode ficar vazio.";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: SecundaryText(
                      text: 'Conte-nos seu relato...',
                      color: Colors.black,
                      align: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InputTextField(
                    title: 'Seu Relato',
                    textEditingController: content,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Esse campo não pode ficar vazio.";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: InputTextButton(
                    title: "Enviar",
                    color: TerciaryColor,
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        authController.posting(
                          content: content.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
