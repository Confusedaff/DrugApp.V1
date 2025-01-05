import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:const Center(child: Text("Settings")),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade400,
        title:const Text("             Settings"),
      ),
    );
  }
}