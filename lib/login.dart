// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:otp_verification/globals.dart';
import 'package:otp_verification/otp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          SizedBox(height: 100),
          SizedBox(height: 20),
          Text("Please enter your mobile number.", style: titleStyle),
          SizedBox(height: 10),
          SizedBox(
            width: 190,
            child: Text("You’ll receive a 4 digit code to verify next.",
                textAlign: TextAlign.center, style: subTitleStyle),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              width: double.infinity,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/flag.png"),
                          SizedBox(width: 10),
                          Text("+91"),
                          SizedBox(width: 10),
                          Text("-"),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile number",
                                  hintStyle:
                                      TextStyle(color: Color(0xff6A6C7B))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff2E3B62))),
                  onPressed: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Verification()),
                    );
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text("CONTINUE", style: TextStyle(color: Colors.white)),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
