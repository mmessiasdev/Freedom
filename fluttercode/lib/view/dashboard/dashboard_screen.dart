import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_grocery/component/colors.dart';
import 'package:my_grocery/controller/dashboard_controller.dart';
import 'package:my_grocery/view/home/home_screen.dart';

import '../account/account_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        backgroundColor:  lightColor,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeScreen(),
              AccountScreen()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
              color: SecudaryColor,
          ),
          child: SnakeNavigationBar.color(
            backgroundColor: SecudaryColor,
            
            padding: const EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: GoogleFonts.asap(
              fontSize: 12
            ),
            unselectedItemColor: BackgroundOffColor,
            showUnselectedLabels: true,
            snakeViewColor: SecudaryColor,
            currentIndex: controller.tabIndex,
            onTap: (val){
              controller.updateIndex(val);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.warning_rounded), label: 'Denúncias'),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Conta')
            ],
          ),
        ),
      ),
    );
  }
}
