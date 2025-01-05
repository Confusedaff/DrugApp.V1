import 'package:flutter/material.dart';

class Messagepage extends StatefulWidget {
  const Messagepage({super.key});

  @override
  State<Messagepage> createState() => _MessagepageState();
}

class _MessagepageState extends State<Messagepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:const Center(child: Text("Messages")),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade400,
        title:const Text("          Notifications"),
      ),
    );
  }
}