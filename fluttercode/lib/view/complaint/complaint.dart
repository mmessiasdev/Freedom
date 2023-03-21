import 'package:Freedom/component/colors.dart';
import 'package:Freedom/component/header.dart';
import 'package:Freedom/component/inputdefault.dart';
import 'package:Freedom/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../component/buttomdefault.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

enum Type {
  agres,
  humilh,
  chant,
  perseg,
  viold,
  assedv,
  assedp,
  assedps,
  assedf,
  out
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  Type? selectType;
  late TextEditingController agres;

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: SizedBox(
                            height: 160,
                            child: GridView(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 98,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 41,
                              ),
                              children: [
                                ButtomCont(
                                  text: 'Agressão',
                                  cor: selectType == Type.agres
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.agres;
                                      print(selectType);
                                    });
                                  },
                                ),
                                ButtomCont(
                                  text: 'Chantagem',
                                  cor: selectType == Type.chant
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.chant;
                                      print(selectType);
                                    });
                                  },
                                ),
                                ButtomCont(
                                  text: 'Humilhação',
                                  cor: selectType == Type.humilh
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.humilh;
                                      print(selectType);
                                    });
                                  },
                                ),
                                ButtomCont(
                                  text: 'Perseguição',
                                  cor: selectType == Type.perseg
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.perseg;
                                      print(selectType);
                                    });
                                  },
                                ),
                                ButtomCont(
                                  text: 'Violência \nPatrimonial',
                                  cor: selectType == Type.assedp
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.assedp;
                                      print(selectType);
                                    });
                                  },
                                ),
                                ButtomCont(
                                  text: 'Assedio \nVerbal',
                                  cor: selectType == Type.assedv
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.assedv;
                                      print(selectType);
                                    });
                                  },
                                ),
                                ButtomCont(
                                  text: 'Assedio \nPsicológico',
                                  cor: selectType == Type.assedps
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.assedps;
                                      print(selectType);
                                    });
                                  },
                                ),
                                ButtomCont(
                                  text: 'Assedio \nFísico',
                                  cor: selectType == Type.assedf
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.assedf;
                                      print(selectType);
                                    });
                                  },
                                ),
                                ButtomCont(
                                  text: 'Outros',
                                  cor: selectType == Type.out
                                      ? lightColor
                                      : TerciaryColor,
                                  onClick: () {
                                    setState(() {
                                      selectType = Type.out;
                                      print(selectType);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
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
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: TerciaryColor,
                                                  border: Border.all(
                                                      color: lightColor)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 20),
                                                child: SubText(
                                                    text: 'baixo',
                                                    color: lightColor,
                                                    align: TextAlign.center),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      180, 36, 62, 1),
                                                  border: Border.all(
                                                      color: lightColor)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 20),
                                                child: SubText(
                                                    text: 'médio',
                                                    color: lightColor,
                                                    align: TextAlign.center),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      255, 0, 47, 1),
                                                  border: Border.all(
                                                      color: lightColor)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 20),
                                                child: SubText(
                                                    text: 'grave',
                                                    color: lightColor,
                                                    align: TextAlign.center),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            children: [
                              SizedBox(
                                child: SubText(
                                  text:
                                      'Caso queria, nos conte como se sente...',
                                  color: lightColor,
                                  align: TextAlign.center,
                                ),
                              ),
                              InputTextField(title: 'Como se sente?')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: InputTextButton(
                            title: 'Enviar',
                            onClick: () {},
                          ),
                        )
                      ],
                    ),
                  ),
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
  ButtomCont(
      {Key? key, required this.text, required this.onClick, required this.cor})
      : super(key: key);
  String text;
  final Function onClick;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: cor,
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
      ),
      onTap: () {
        onClick();
      },
    );
  }
}
