import 'package:Freedom/component/colors.dart';
import 'package:Freedom/component/header.dart';
import 'package:Freedom/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          MainHeader(),
          Expanded(
            child: Container(
              color: TerciaryColorOff,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Center(
                      child: Column(
                        children: [
                          PrimaryText(
                              text: 'Denúncias',
                              color: lightColor,
                              align: TextAlign.center),
                          SubText(
                              text:
                                  'Escolha as opções que mais se assemelham ao ocorrido',
                              color: OffColor,
                              align: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
