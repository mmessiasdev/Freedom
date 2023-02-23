import 'package:flutter/material.dart';
import 'package:fluttercode/view/components/texts.dart';

class PrimaryButtom extends StatelessWidget {
  PrimaryButtom({super.key, required this.text, required this.color, required this.route, required this.colorText});
  String text;
  Color color;
  Widget route;
  Color colorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 305,
        height: 41,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
        ),
        child: Center(child: ButtomText(text: text, color: colorText, align: TextAlign.center)),
      ),
     onTap: () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route))
     },
    );
  }
}



class SecundaryButtom extends StatelessWidget {
  SecundaryButtom({super.key, required this.text, required this.color, required this.route, required this.colorText, required this.borderColor});
  String text;
  Color color;
  Widget route;
  Color colorText;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 123,
        height: 33,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: borderColor,
          ),
          color: color,
        ),
        child: Center(child: ButtomText(text: text, color: colorText, align: TextAlign.center)),
      ),
     onTap: () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route))
     },
    );
  }
}