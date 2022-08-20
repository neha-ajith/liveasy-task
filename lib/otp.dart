// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_verification/globals.dart';
import 'package:otp_verification/select_profile.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
          Text("Verify phone", style: titleStyle),
          SizedBox(height: 10),
          SizedBox(
            width: 150,
            child: Text("Code is sent to +91-XXXXXXXXXX",
                textAlign: TextAlign.center, style: subTitleStyle),
          ),
          SizedBox(height: 20),
          OtpTextField(
            filled: true,
            fillColor: Color(0xff93D2F3),
            fieldWidth: 55,
            numberOfFields: 6,
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderWidth: 0,
            showFieldAsBox: true,
            onSubmit: (String verificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn’t receive the code?"),
              TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {},
                  child: Text("Request Again"))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      MaterialPageRoute(builder: (context) => SelectProfile()),
                    );
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("VERIFY & CONTINUE",
                        style: TextStyle(color: Colors.white)),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
