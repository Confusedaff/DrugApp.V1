import 'package:drug_app/drawer/aboutuspage.dart';
import 'package:drug_app/drawer/accountpage.dart';
import 'package:drug_app/drawer/doctorpage.dart';
import 'package:drug_app/drawer/messagepage.dart';
import 'package:drug_app/drawer/settingspage.dart';
import 'package:drug_app/pages/firstpage.dart';
import 'package:drug_app/pages/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,

      home:const Firstpage(),

      routes: {

        '/drawer/accountpage': (context) =>const Accountpage(),
        '/drawer/settingspage': (context) =>const Settingspage(),
        '/drawer/messagepage': (context) =>const Messagepage(),
        '/drawer/doctorpage': (context) =>const Doctorpage(),
        '/drawer/aboutuspage': (context) =>const Aboutuspage(),
        '/drawer/loginpage': (context) => Loginpage(),
      },
      
  );
  }
}
