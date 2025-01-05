import 'package:flutter/material.dart';

class Doctorpage extends StatefulWidget {
  const Doctorpage({super.key});

  @override
  State<Doctorpage> createState() => _DoctorpageState();
}

class _DoctorpageState extends State<Doctorpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:const Center(child: Text("Doctor page")),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade400,
        title:const Text("              Support"),
      ),
    );
  }
}