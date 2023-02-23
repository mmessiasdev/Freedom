import 'package:flutter/material.dart';
import 'package:my_grocery/component/texts.dart';

class InputTextButton extends StatelessWidget {
  final String title;
  final Function onClick;
  const InputTextButton({Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(19, 68, 90, 1),
        minimumSize: const Size(double.maxFinite, 50),
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onClick();
      },
      child: ButtomText(text: title,)
    );  
  }
}
