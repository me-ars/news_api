import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/widgets/Button.dart';
import 'package:news/widgets/TextField.dart';
import 'package:news/widgets/google_apple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _funState();
}

class _funState extends State<LoginPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage("lib/asset/bg.jpg"))),
          ),
          Container(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 210,
                ),
                Center(
                    child: Text(
                  "Login",
                  style: GoogleFonts.inter(fontSize: 20, color: Colors.white60),
                )),
                MyField(field: "Email"),
                MyField(field: "Password"),
                Padding(
                  padding: const EdgeInsets.only(left: 210),
                  child: Text(
                    "Forget password",
                    style: GoogleFonts.inter(color: Colors.orange),
                  ),
                ),
                Mybutton(btnText: "Login"),
                Padding(
                  padding: const EdgeInsets.only(left: 165),
                  child: Text(
                    "Don't have an account?",
                    style: GoogleFonts.inter(color: Colors.orange),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 275),
                  child: Text(
                    "SignUp",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                ),SizedBox(height: 20,),
                Text("or Login with",style: GoogleFonts.inter(color: Colors.orange),),
               SizedBox(height: 25,)
               , Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    otherLogin(text: "Google", icon: Icons.g_mobiledata),
                    otherLogin(text: "Apple", icon: Icons.apple)
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    // transform: GradientRotation(100),
                    begin: Alignment.center,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xff111111),
                  // Colors.redAccent,
                  Color.fromARGB(30, 11, 11, 11),
                ])),
          )
        ],
      ),
    );
  }
}
