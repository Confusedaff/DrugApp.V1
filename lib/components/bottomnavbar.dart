import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Bottomnavbar extends StatelessWidget {
final void Function(int)? onTabChange;

   Bottomnavbar({
    super.key,
    required this.onTabChange
    });

  @override
  Widget build(BuildContext context) {
    
    return Container(

      child: GNav(
        color: Colors.lightBlueAccent.shade200,
        activeColor: Colors.lightBlueAccent.shade700,
        tabBorderRadius: 16,
        tabBackgroundColor: Colors.lightBlueAccent.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 8,
        onTabChange: (value) => onTabChange !(value),

      tabs:const [

           GButton(
            icon:Icons.home,
            text: "Home",
            ),

          GButton(
            icon: Icons.pin_drop,
            text: "Map"
            ),

          GButton(
            icon: Icons.face,
            text: "Scan",
            ),

          GButton(
              icon: Icons.monitor_heart,
              text: "Health", 
            ),
        ],
      ),

    );
  }
}