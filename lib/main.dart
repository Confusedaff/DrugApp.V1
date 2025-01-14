import 'package:camera/camera.dart';
import 'package:drugapp/Auth/auth_gate.dart';
import 'package:drugapp/drawer/aboutuspage.dart';
import 'package:drugapp/drawer/accountpage.dart';
import 'package:drugapp/drawer/doctorpage.dart';
import 'package:drugapp/drawer/messagepage.dart';
import 'package:drugapp/drawer/settingspage.dart';
import 'package:drugapp/pages/homepage.dart';
import 'package:drugapp/pages/loginpage.dart';
import 'package:drugapp/pages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

List<CameraDescription>? cameras;

Future<void> main() async{
  
   WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://beuvlqdiresecqdxvclx.supabase.co", 
    anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJldXZscWRpcmVzZWNxZHh2Y2x4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYyNzE1MzcsImV4cCI6MjA1MTg0NzUzN30.4phfidHHuBhtC0LpLGfsFq6tabVSIMfox-2ftkf3yQE" );

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: AuthGate(),

      routes: {

        '/drawer/accountpage': (context) =>const Accountpage(),
        '/drawer/settingspage': (context) =>const Settingspage(),
        '/drawer/messagepage': (context) =>const Messagepage(),
        '/drawer/doctorpage': (context) =>const Doctorpage(),
        '/drawer/aboutuspage': (context) =>const Aboutuspage(),
        //'/drawer/loginpage': (context) => AuthGate(),
        '/drawer/registerpage': (context) =>const Registerpage(),
        '/loginpage': (context) => Loginpage(),
        //'/exp/public_home': (context) => PublicHome(),
        '/homepage': (context) => Homepage(),
      },
      
  );
  }
}
