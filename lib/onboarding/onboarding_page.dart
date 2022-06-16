import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final height = media.height;
    final width = media.width;
    return Scaffold(
      backgroundColor: const Color(0xff205CC0),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(height * 0.10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              'assets/onboarding.png',
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            'Enjoy \n Your Food',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('home'),
            child: Container(
              alignment: Alignment.center,
              width: width * 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff000000),
                    offset: Offset(1, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 20, color: Color(0xff444655)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
