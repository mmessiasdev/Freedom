import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  PrimaryText({required this.text, required this.color, required this.align});
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
  ButtomText({
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.aleo(
          fontSize: 14,
          textStyle: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class ButtomSecundary extends StatelessWidget {
  ButtomSecundary({
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.aleo(
          fontSize: 14,
          textStyle: TextStyle(
            color: Color.fromRGBO(19, 68, 90, 1),
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}



class SubText extends StatelessWidget {
  SubText({required this.text, required this.color, required this.align});
  String text;
  Color color;
  TextAlign align;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.asap(
          fontSize: 12,
          textStyle: TextStyle(
            color: color,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
    ;
  }
}
