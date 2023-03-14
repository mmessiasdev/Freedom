import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Freedom/component/texts.dart';
import 'package:Freedom/controller/controllers.dart';
import 'package:Freedom/extention/string_extention.dart';
import 'package:Freedom/component/buttomdefault.dart';
import 'package:Freedom/component/buttomborder.dart';
import 'package:Freedom/component/inputdefault.dart';

import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: SizedBox(
                      height: 274,
                      child: Image(
                        image: AssetImage('assets/images/ilustration/login.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: PrimaryText(
                        text: 'Login',
                        color: Color.fromRGBO(19, 68, 90, 1),
                        align: TextAlign.start),
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
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: SubText(
                      align: TextAlign.end,
                      color: Color.fromRGBO(19, 68, 90, 1),
                      text: 'Esqueceu a senha?',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InputTextButton(
                      title: "Login",
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          authController.signIn(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  InputOutlineButton(
                    title: "Voltar",
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("É um novo usário? "),
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                              },
                              child: const Text(
                                "Crie uma conta.", 
                                style: TextStyle(
                                  color: Color.fromRGBO(19, 68, 90, 1),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
