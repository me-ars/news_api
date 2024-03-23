import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyField extends StatelessWidget {
  String field;

  MyField({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(style: GoogleFonts.inter(color: Color(0xffF1B42F)),
          cursorColor: Colors.orangeAccent,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffFF8C00))),
            hintStyle: GoogleFonts.inter(color: Colors.orange[300]),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.orange,
            )),
            border: InputBorder.none,
            hintText: field,
          ),
        ),
      ),
    );
  }
}
