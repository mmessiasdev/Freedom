import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryInput extends StatelessWidget {
  PrimaryInput({super.key, required this.icon, required this.title});
  Icon icon;
  String title;

  @override
  Widget build(BuildContext csontext) {
    return TextFormField(
        decoration: InputDecoration(
          hintText: title,
          hintStyle: GoogleFonts.aleo(),
          icon: icon,
        ),
        
      
    );
  }
}