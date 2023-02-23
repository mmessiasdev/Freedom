import 'package:flutter/material.dart';
import 'package:fluttercode/extension/textfilter.dart';
import 'package:fluttercode/view/components/buttons.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/inputfield.dart';
import 'package:fluttercode/view/components/texts.dart';
import 'package:fluttercode/view/pages/login/loginin.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  @override
  void dispose() {
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
          child: Column(
            children: [
              SizedBox(
                height: 274,
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/e113/3fa6/7469d52e138666ba6143f050d90a6404?Expires=1677456000&Signature=N6dHFpIKUgfoZbGK3g9tIwZJj6FisYuMxh8JbwHKu~U9Z7MiLg1-hjAhlV-LSQOmf9xbPv2b9umi7cg8v~UNyq1Ssjqa1-e3LcOySFpUZvMQK3s84Lwy6HR3IvSGMyDX-p3OvRY8cBo63dYzKnC5emaZL07~kG9XWIF2-goCVai8tIBYJmsEUvnbEAzYyo2QgzVq3-WSgWYzNI9LpTCugGuJVv0Ajqiel2~m-rijYveRqA2Z5dMLEU9JNBDukGhLVpFU1SkLqe6Dnr1sLczLVhYHP9f-yOtcN0Qbg8EeuwkHHxwS3mRxIJ31DEobwBy0tjRuX0uEpE73fpZuY6NEEw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: PrimaryText(
                      text: 'Resetar Senha',
                      color: PrimaryColor,
                      align: TextAlign.start),
                ),
              ),
              InputTextField(
                  icon: Icon(Icons.lock),
                  title: "Digite sua nova senha.",
                  textEditingController: pass,
                  validation: (String? value) {
                    List<String> _validation = [];
                    if (value == null || value.isEmpty) {
                      return "Preencha o campo.";
                    } else {
                      if (!value.isValidPasswordHasNumber) {
                        _validation.add("A senha precisa de um número");
                      }
                      if (!value.isValidPasswordHasSpecialCharacter) {
                        _validation
                            .add("A senha precisa de um caracter especial");
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
                  }),
              InputTextField(
                icon: Icon(Icons.lock),
                title: "Confirme a senha",
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
              PrimaryButtom(
                  text: 'Resetar Senha',
                  color: PrimaryColor,
                  route: LoginIn(),
                  colorText: Colors.white),
              SecundaryButtom(
                text: 'Voltar',
                color: Colors.white,
                route: LoginIn(),
                colorText: PrimaryColor,
                borderColor: PrimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
