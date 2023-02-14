import 'package:flutter/material.dart';
import 'package:fluttercode/view/components/texts.dart';

class PrimaryButtom extends StatelessWidget {
  PrimaryButtom({super.key, required this.text, required this.color, required this.route});
  String text;
  Color color;
  Widget route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Container(
          width: 259,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: color,
          ),
          child: Center(child: ButtomText(text: 'Começar', color: Colors.black, align: TextAlign.center)),
        ),
      ),
     onTap: () => {
      Navigator.push(context, MaterialPageRoute(builder: (context) => route))
     },
    );
  }
}
