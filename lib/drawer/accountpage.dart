import 'package:flutter/material.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:const Center(child: Text("Account page")),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade400,
        title:const Text("         My Account"),
      ),
    );
  }
}