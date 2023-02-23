import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/component/header.dart';
import 'package:my_grocery/controller/controllers.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
      children: [
        MainHeader(),
      ],
    ));
  }
}
