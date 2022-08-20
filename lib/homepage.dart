// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:otp_verification/globals.dart';
import 'package:otp_verification/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("English"), value: "English"),
    DropdownMenuItem(child: Text("Hindi"), value: "Hindi"),
  ];
  String selectedValue = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/image.png"),
          SizedBox(height: 20),
          Text("Please select your language.", style: titleStyle),
          SizedBox(height: 10),
          SizedBox(
            width: 190,
            child: Text("You can change the language at any time.",
                textAlign: TextAlign.center, style: subTitleStyle),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  value: selectedValue,
                  items: menuItems),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 250,
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
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("NEXT", style: TextStyle(color: Colors.white)),
                )),
          ),
        ]),
      ),
    );
  }
}
