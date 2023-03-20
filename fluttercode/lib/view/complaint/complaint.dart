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
                            Column(
                              children: [
                                PrimaryText(
                                  text: 'Precisa de ajuda?',
                                  color: lightColor,
                                  align: TextAlign.center,
                                ),
                                SubText(
                                  text:
                                      'Escolha as opções que mais se assemelham ao ocorrido',
                                  color: OffColor,
                                  align: TextAlign.center,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: SizedBox(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                child: GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 98,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 41,
                                  ),
                                  children: [ButtomCont(text: 'Agressão')],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: PrimaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SubText(
                                              text:
                                                  'Qual o nível de risco do problema?',
                                              color: lightColor,
                                              align: TextAlign.center,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.cyan,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        border: Border.all(
                                                            color: lightColor)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 5,
                                                          horizontal: 20),
                                                      child: SubText(
                                                          text: 'baixo',
                                                          color: lightColor,
                                                          align:
                                                              TextAlign.center),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 0, 97, 110),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        border: Border.all(
                                                            color: lightColor)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 5,
                                                          horizontal: 20),
                                                      child: SubText(
                                                          text: 'médio',
                                                          color: lightColor,
                                                          align:
                                                              TextAlign.center),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 42, 42, 42),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        border: Border.all(
                                                            color: lightColor)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 5,
                                                          horizontal: 20),
                                                      child: SubText(
                                                          text: 'grave',
                                                          color: lightColor,
                                                          align:
                                                              TextAlign.center),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ButtomCont extends StatelessWidget {
  ButtomCont({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color: TerciaryColorOff,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        border: Border.all(
          width: 1,
          color: SecudaryColor,
        ),
      ),
      child: Center(
          child: SubText(
              text: text, color: SecudaryColor, align: TextAlign.center)),
    );
  }
}
