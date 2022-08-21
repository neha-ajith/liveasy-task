// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_verification/globals.dart';
import 'package:otp_verification/select_profile.dart';

class Verification extends StatefulWidget {
  final String verificationId;
  const Verification({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late String code;
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
              code = verificationCode;
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
                    FirebaseAuth auth = FirebaseAuth.instance;

                    var smsCode = code.trim();

                    AuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: smsCode);
                    auth
                        .signInWithCredential(credential)
                        .then((UserCredential result) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectProfile()));
                    }).catchError((e) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Invalid code!!"),
                        ),
                      );
                      print(e);
                    });

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SelectProfile()),
                    // );
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
