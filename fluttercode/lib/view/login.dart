import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercode/view/components/buttons.dart';
import 'package:fluttercode/view/components/texts.dart';

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
                    color: Color.fromRGBO(30, 31, 32, 1),
                  ),
                ),
              ),
              PrimaryButtom(
                route: LoginIn(),
                text: 'Começar',
                color: Color.fromRGBO(240, 185, 195, 1),
              )
            ],
          )
        ],
      ),
    );
  }
}

class LoginIn extends StatelessWidget {
  const LoginIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Image(
                image: CachedNetworkImageProvider(
                  'https://s3-alpha-sig.figma.com/img/e68e/7308/05492c4217afe0b850c3c6cef08b2ce3?Expires=1677456000&Signature=ahkCCVNUhn3YJYKeIJQmkVcmy2BF~aAigevyRLWXTd03DwrB3w2ZZmze9MusB9otHiNcHZWQWxu53k~9OdAi1Sr0r0G3vzLhNi7gcq9c~~AYJvEzkhpWCZCPSDf09OWGQnU5eAp1aSydNXqlPR9igWxONMw1iEa4TXO1lI1VHb745t~~R43x2AeVPI1I8AXaYbvBMXqfJV9dcxGtkLvOsd0TH37XEfXJfYVPxcEwz-36I0Qum2mJaWDrjoUxWw--OCpt7v1JGhZSp88ONNjY9jrEFiCkFaDllcz6pQ2vpPIeJ1czazP0DEgL1vSznufDVYIdmqm0HJ9BmUUlhxSqlg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                  maxHeight: 276,
                  maxWidth: 276,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: PrimaryText(
                      text: 'Login',
                      color: Color.fromRGBO(19, 68, 90, 1),
                      align: TextAlign.start),
                )),
          )
        ],
      ),
    );
  }
}
