import 'package:Freedom/controller/auth_controller.dart';
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

  @override
  void dispose() {
    content.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  DraggableScrollableSheet(
    builder: (_, controller) => Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: SecundaryText(
                  text: 'Conte-nos seu relato...',
                  color: Colors.black,
                  align: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InputTextField(
                  title: 'Seu Relato',
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Esse campo não pode ficar vazio.";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InputTextButton(
                  title: "Enviar",
                  onClick: () {
                    // AuthController().posting(content: content.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );;
  }
}