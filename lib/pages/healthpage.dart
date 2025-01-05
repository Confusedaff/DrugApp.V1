import 'package:flutter/material.dart';

class Healthpage extends StatefulWidget {
  const Healthpage({super.key});

  @override
  State<Healthpage> createState() => _HealthpageState();
}

class _HealthpageState extends State<Healthpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(child: Text("HEALTH PAGE")),
    );
  }
}