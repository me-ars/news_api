import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class otherLogin extends StatelessWidget {
  String? text;
  IconData icon;
  otherLogin({super.key,required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: MediaQuery.of(context).size.height*0.10,
          width: MediaQuery.of(context).size.width*0.20,
          child: Icon(icon,color: Colors.orange,size: 40,),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.orange)
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text!,style:GoogleFonts.inter(fontWeight: FontWeight.bold,color: Colors.orangeAccent)),
        )
      ],
    );
  }
}
