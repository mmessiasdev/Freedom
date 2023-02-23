import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercode/extension/textfilter.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/inputfield.dart';
import 'package:fluttercode/view/pages/login/register.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/buttons.dart';
import '../../components/texts.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({super.key});

  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(50),
                child: SizedBox(
                  height: 274,
                  child: Image(
                    image: CachedNetworkImageProvider(
                      'https://s3-alpha-sig.figma.com/img/e68e/7308/05492c4217afe0b850c3c6cef08b2ce3?Expires=1677456000&Signature=ahkCCVNUhn3YJYKeIJQmkVcmy2BF~aAigevyRLWXTd03DwrB3w2ZZmze9MusB9otHiNcHZWQWxu53k~9OdAi1Sr0r0G3vzLhNi7gcq9c~~AYJvEzkhpWCZCPSDf09OWGQnU5eAp1aSydNXqlPR9igWxONMw1iEa4TXO1lI1VHb745t~~R43x2AeVPI1I8AXaYbvBMXqfJV9dcxGtkLvOsd0TH37XEfXJfYVPxcEwz-36I0Qum2mJaWDrjoUxWw--OCpt7v1JGhZSp88ONNjY9jrEFiCkFaDllcz6pQ2vpPIeJ1czazP0DEgL1vSznufDVYIdmqm0HJ9BmUUlhxSqlg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: PrimaryText(
                              text: 'Login',
                              color: PrimaryColor,
                              align: TextAlign.start,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InputTextField(
                            icon: Icon(Icons.alternate_email_rounded),
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
                        ),
                        InputTextField(
                            icon: Icon(Icons.lock),
                            title: "Digite sua senha",
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
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: PrimaryButtom(
                              text: 'Login',
                              color: PrimaryColor,
                              route: LoginIn(),
                              colorText: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Criar Conta',
                              style: GoogleFonts.aleo(
                                color: PrimaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
        ),
      ),
    );
  }
}
