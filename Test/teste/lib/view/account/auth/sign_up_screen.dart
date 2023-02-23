import 'package:flutter/material.dart';
import 'package:my_grocery/component/colors.dart';
import 'package:my_grocery/component/texts.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/extention/string_extention.dart';

import '../../../component/input_outline_button.dart';
import '../../../component/input_text_button.dart';
import '../../../component/input_text_field.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: ListView(
                children: [
                  PrimaryText(
                      text: 'Criar Conta',
                      color: PrimaryColor,
                      align: TextAlign.start),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InputTextField(
                        title: 'Nome Completo',
                        icon: Icon(Icons.person),
                        textEditingController: fullNameController,
                        validation: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Esse campo não pode ficar vazio.";
                          }
                          return null;
                        },
                      ),
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
                          return "Esse email não é válido";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InputTextField(
                      title: 'Senha',
                      icon: Icon(Icons.lock),
                      obsecureText: true,
                      textEditingController: passwordController,
                      validation: (String? value) {
                        List<String> _validation = [];
                        if (value == null || value.isEmpty) {
                          return "Esse campo não pode ficar vazio.";
                        } else {
                          if (!value.isValidPasswordHasNumber) {
                            _validation.add("Sua senha precisa conter numeros");
                          }
                          if (!value.isValidPasswordHasCapitalLetter) {
                            _validation.add(
                                "Sua senha precisa conter letras maiuscular");
                          }
                          if (!value.isValidPasswordHasLowerCaseLetter) {
                            _validation.add("Sua senha precisa conter letras");
                          }
                        }
                        String msg = '';
                        if (_validation.isNotEmpty) {
                          for (var i = 0; i < _validation.length; i++) {
                            msg = msg + _validation[i];
                            if ((i + 1) != _validation.length) {
                              msg = msg + "\n";
                            }
                          }
                        }
                        return msg.isNotEmpty ? msg : null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InputTextField(
                      icon: Icon(Icons.lock),
                      title: 'Confirme sua Senha',
                      obsecureText: true,
                      textEditingController: confirmController,
                      validation: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Esse campo não pode ficar vazio.";
                        } else if (passwordController.text != value) {
                          return "Confirm password not match";
                        }
                        return null;
                      },
                    ),
                  ),
                                Padding(
                          padding: const EdgeInsets.only(top: 30),
                    child: InputTextButton(
                      title: "Criar Conta",
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          authController.signUp(
                            fullName: fullNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
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
                  const Spacer(
                    flex: 5,
                  ),
                                Padding(
                          padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Eu já tenho uma conta, "),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()));
                          },
                          child: const Text(
                            "Fazer Login",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
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
