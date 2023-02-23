import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/components/buttons.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/texts.dart';
import 'package:fluttercode/view/pages/login/login.dart';

class Localization extends StatelessWidget {
  const Localization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Container(
            width: 343,
            height: 295,
            decoration: BoxDecoration(
              color: SecudaryColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText(
                    text: 'Confirme sua localização',
                    color: PrimaryColor,
                    align: TextAlign.center,
                  ),
                  PrimaryButtom(
                    text: 'Ok',
                    color: TerciaryColor,
                    route: Login(),
                    colorText: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
