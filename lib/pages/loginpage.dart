import 'package:drug_app/components/loginpage/mytextfield.dart';
import 'package:drug_app/components/loginpage/signinbutton.dart';
import 'package:drug_app/components/loginpage/squaretile.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
Loginpage({super.key});

  void signIn(){

  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      
      body:SafeArea(

        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
          
            const SizedBox(height: 10,),
          
            const Center(
                child: Icon(Icons.lock,
                size: 120,),
              ),

            const SizedBox(height:30,),

              Text("Welcome back !!!",
              style: TextStyle(
                color: Colors.grey[700]
              ),),

              const SizedBox(height: 25,),
          
              Mytextfield(
              controller: usernameController,
              hinttext: 'Username',
              obscuretext: false,
             ),

              const SizedBox(height: 10,),

              Mytextfield(
              controller: passwordController,
              hinttext: 'Password',
              obscuretext: true,
              ),

              const SizedBox(height:4,),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal:25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Text("Forgot password?"),
                  ],
                ),
              ),

              const SizedBox(height: 15,),

              Button(
                onTap: signIn,
              ),

              const SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 10),
                      child:Center(child:
                      Text("or continue with",
                      style: TextStyle(color: Colors.grey[700]),),
                      ),
                    ),
                
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25,),

              const Row(

                mainAxisAlignment: MainAxisAlignment.center,

               children: [

                SquareTile(
                imagepath: 'lib/Images/g.png',
                ),

                const SizedBox(width: 10,),

                SquareTile(
                imagepath: 'lib/Images/a.png',
                )
                ],
              ),

                const SizedBox(height: 25,),

             
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?"),
                    SizedBox(width: 4,),
                    Text("Register Now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}