import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  PrimaryText({super.key, required this.text, required this.color, required this.align});
  String text;
  Color color;
  TextAlign align;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
           text,
           textAlign: TextAlign.center,
           style: GoogleFonts.aleo(
            fontSize: 38, 
            textStyle: TextStyle(
              color: color,
              decoration: TextDecoration.none,
           ),
        ),
      ),
    );
  }
}


class ButtomText extends StatelessWidget {
  ButtomText({super.key, required this.text, required this.color, required this.align});
  String text;
  Color color;
  TextAlign align;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
           text,
           textAlign: TextAlign.center,
           style: GoogleFonts.aleo(
            fontSize: 14, 
            textStyle: TextStyle(
              color: color,
              decoration: TextDecoration.none,
           ),
        ),
      ),
    );
  }
}