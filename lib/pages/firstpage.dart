import 'package:drugapp/Auth/auth_service.dart';
import 'package:drugapp/components/bottomnavbar.dart';
import 'package:drugapp/pages/healthpage.dart';
import 'package:drugapp/pages/homepage.dart';
import 'package:drugapp/pages/mappage.dart';
import 'package:drugapp/pages/scanpage.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {

final authService = AuthService();

  void logout() async {
  await authService.signOut();
}


  int selected = 0;

  void bottomnavigation(int index){
    setState(() { 
      selected = index ;
    });
  }

  final List<Widget> pages = [

   const Homepage(),

   const Mappage(),

   const Scanpage(),

   const Healthpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        bottomNavigationBar: Wrap(
      
          children: [
          Bottomnavbar(
          onTabChange:(index) => bottomnavigation(index),
            ),
          ],
          
        ),
      
          backgroundColor: Colors.lightBlueAccent.shade400,
      
          body: pages[selected],

          appBar: AppBar(

            backgroundColor: Colors.lightBlueAccent.shade400,
            leading: Builder(
              builder:(context) => IconButton(

                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,),

                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },

              )
              ),
              ),

              drawer:Drawer(
                
                backgroundColor: Colors.blue.shade400,

                
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  
                      DrawerHeader(
                        child:Image.asset(
                          'lib/Images/medicine.png',
                          ),
                          ),
                  
                  Padding(
                    padding: EdgeInsets.only(top:10.0),
                  
                    child: ListTile(
                    leading:const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                    title:const Text(
                      "My Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      ),
                      
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context,'/drawer/accountpage');
                      },
                      ),
                      ),
                  
                     Padding(
                      padding:const EdgeInsets.only(top:10.0),
                      child: ListTile(
                        leading:const Icon(
                          Icons.settings,
                          size: 35,
                          color: Colors.white,),
                        title:const Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                          ),
                  
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context,'/drawer/settingspage');
                          },
                        ),
                    ),
                  
                     Padding(
                      padding:const EdgeInsets.only(top:10.0),
                      child: ListTile(
                        leading:const Icon(
                          Icons.notifications,
                          size: 35,
                          color: Colors.white,),
                        title:const Text(
                          "Messages",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                          ),
                  
                           onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context,'/drawer/messagepage');
                          },
                        ),
                    ),
                  
                     Padding(
                      padding:const EdgeInsets.only(top:10.0),
                      child: ListTile(
                        leading:const Icon(
                          Icons.medical_services,
                          size: 35,
                          color: Colors.white,),
                        title:const Text(
                          "Doctors",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                          ),
                  
                           onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context,'/drawer/doctorpage');
                          },
                        ),
                    ),
                  
                      Padding(
                      padding: EdgeInsets.only(top:10.0),
                      child: ListTile(
                        leading:const Icon(
                          Icons.info_rounded,
                          size: 35,
                          color: Colors.white,),
                        title:const Text(
                          "About Us",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                          ),
                  
                           onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context,'/drawer/aboutuspage');
                          },
                        ),
                    ),
                    
                      
                      Padding(
                        padding:const EdgeInsets.only(top:10.0),
                        child: ListTile(
                           leading:const Icon(
                            Icons.logout,
                            size: 35,
                            color: Colors.white,),
                          title:const Text(
                            "Logout",
                             style: TextStyle(
                             color: Colors.white,
                              fontSize: 20),
                            ),
                          
                            onTap: () {
                              logout();
                             // Navigator.pop(context);
                              //Navigator.pushNamed(context,'/drawer/accountpage');
                            },
                            ),
                          ),

                         //Padding(
                        //  padding:const EdgeInsets.only(top:10.0),
                         // child: ListTile(
                          //  leading:const Icon(
                           //   Icons.logout,
                           //   size: 35,
                          //    color: Colors.white,),
                          //  title:const Text(
                            //  "Login",
                            //  style: TextStyle(
                             //   color: Colors.white,
                            //    fontSize: 20),
                            //  ),
                          
                            //   onTap: () {
                             //   Navigator.pop(context);
                              //  Navigator.pushNamed(context,'/drawer/loginpage');
                             // },
                            //),
                          //),                         



                    ],
                  ),
              ),
          ),
      );
  }
}