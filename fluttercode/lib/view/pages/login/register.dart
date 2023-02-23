import 'package:flutter/material.dart';
import 'package:fluttercode/controller/authapi.dart';
import 'package:fluttercode/extension/textfilter.dart';
import 'package:fluttercode/view/components/buttonf.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/inputfield.dart';
import 'package:fluttercode/view/components/texts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    pass.dispose();
    confirmPass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: PrimaryText(
                    text: 'Criar Conta',
                    color: PrimaryColor,
                    align: TextAlign.start,
                  ),
                ),
              ),
              InputTextField(
                icon: const Icon(Icons.person),
                title: "Digite seu nome completo.",
                textEditingController: fullName,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o campo";
                  } else if (!value.isValidName) {
                    return "Insira um nome válido";
                  }
                  return null;
                },
              ),
              InputTextField(
                icon: const Icon(Icons.alternate_email_rounded),
                title: "Digite seu email",
                textEditingController: email,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o Campo.";
                  } else if (!value.isValidEmail) {
                    return "Insira um email válido";
                  }
                  return null;
                },
              ),
              InputTextField(
                icon: const Icon(Icons.lock),
                title: "Digite sua senha.",
                obsecureText: true,
                textEditingController: pass,
                validation: (String? value) {
                  List<String> _validation = [];
                  if (value == null || value.isEmpty) {
                    return "Preencha o campo.";
                  } else {
                    if (!value.isValidPasswordHasNumber) {
                      _validation.add("A senha precisa de um número");
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
              InputTextField(
                icon: const Icon(Icons.lock),
                title: "Confirme sua senha",
                obsecureText: true,
                textEditingController: confirmPass,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha esse campo";
                  } else if (pass.text != value) {
                    return "As senhas não são iguais.";
                  }
                  return null;
                },
              ),
              InputTextButton(
                title: 'Entrar',
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    AuthController.instance.signUp(
                        fullname: fullName.text,
                        email: email.text,
                        password: pass.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
