import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercode/view/components/buttons.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/texts.dart';
import 'package:fluttercode/view/pages/homepages/home.dart';
import 'package:get/get.dart';

import 'loginin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            child: Image(
              alignment: Alignment.topCenter,
              image: const CachedNetworkImageProvider(
                'https://s3-alpha-sig.figma.com/img/b436/0cb7/e831083ad8becc23b850df10f0cd5780?Expires=1677456000&Signature=ODz2Q8cjACnqw4RIbzna4UKLau4g8CQBdofDF4IroSFO7uimqevOYJ104iBsmbVJwqMF9TaNhHdjASYDXPglkokY8FCZp4a-DWC~lxjE8RruoHLLwxdFOik9jDrbVd48vVxO69BoWsLs3GzFS~NLgUIWUF--d5tYFUxAZRngOyDY9ufWPXsi1Qt~2kiMJXMrAU5X17x9YRRLL-56laYrjK4PH3giSNUS4-ty5k0XTAM-vCrI1~tvBQcYYb5iUEKPSUHP9mS-i2P1fvmUVeHyjjCSeBE8fn4Qz9EXwZdTrNDnSHo7WHFr~yoU~bJqdEFFPNthciqwWqCqJyAapWtUzg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                maxHeight: 1080,
                maxWidth: 1920,
              ),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 1,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: PrimaryText(
                    align: TextAlign.center,
                    text: 'Seja Livre,\n Seja Freedom!',
                    color: PrimaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: PrimaryButtom(
                    route: LoginIn(),
                    text: 'Começar',
                    colorText: Colors.white,
                    color: PrimaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(const Login());
    Get.put(const HomePage());
  }
}