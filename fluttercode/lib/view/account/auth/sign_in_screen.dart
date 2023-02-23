import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/component/texts.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/extention/string_extention.dart';
import 'package:my_grocery/component/buttomdefault.dart';
import 'package:my_grocery/component/buttomborder.dart';
import 'package:my_grocery/component/inputdefault.dart';




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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(25),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      PrimaryText(
                          text: 'Login',
                          color: Color.fromRGBO(19, 68, 90, 1),
                          align: TextAlign.start),
                    ],
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
                        return "Please enter valid email";
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SubText(
                        align: TextAlign.end,
                        color: Color.fromRGBO(19, 68, 90, 1),
                        text: 'Esqueceu a senha?',
                      ),
                    )
                  ],
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
                const Spacer(
                  flex: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("É um novo usário?, "),
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
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
