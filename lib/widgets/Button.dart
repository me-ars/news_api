import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mybutton extends StatelessWidget {
  String btnText;

  Mybutton({super.key, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width*0.9,
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(4)),
          child: TextButton(
              onPressed: () {},
              child: Text(
                btnText,
                style: GoogleFonts.inter(color: Colors.white,fontSize: 15),
              ))),
    );
  }
}
