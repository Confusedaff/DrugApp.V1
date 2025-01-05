import 'package:flutter/material.dart';

class Aboutuspage extends StatefulWidget {
  const Aboutuspage({super.key});

  @override
  State<Aboutuspage> createState() => _AboutuspageState();
}

class _AboutuspageState extends State<Aboutuspage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:const Center(child: Text("Account page")),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade400,
        title:const Text("            About Us"),
      ),
    );
  }
}