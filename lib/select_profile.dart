// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:otp_verification/globals.dart';

class SelectProfile extends StatefulWidget {
  const SelectProfile({Key? key}) : super(key: key);

  @override
  State<SelectProfile> createState() => _SelectProfileState();
}

var profile;

class _SelectProfileState extends State<SelectProfile> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Please select your profile", style: titleStyle),
            SizedBox(height: 20),
            ProfileRadio(
              value: "shipper",
              title: "Shipper",
            ),
            SizedBox(height: 30),
            ProfileRadio(
              value: "transporter",
              title: "Transporter",
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff2E3B62))),
                  onPressed: (() {}),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text("CONTINUE", style: TextStyle(color: Colors.white)),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}

class ProfileRadio extends StatefulWidget {
  final dynamic value;
  final String title;
  const ProfileRadio({Key? key, required this.value, required this.title})
      : super(key: key);

  @override
  State<ProfileRadio> createState() => _ProfileRadioState();
}

class _ProfileRadioState extends State<ProfileRadio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Radio(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
            value: "${widget.value}",
            groupValue: profile,
            onChanged: (value) {
              setState(() {
                profile = value;
              });
            },
          ),
          Image.asset("assets/${widget.value}.png"),
          SizedBox(width: 30),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title, style: titleStyle),
                SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing",
                      style: subTitleStyle),
                )
              ])
        ],
      ),
    );
  }
}
