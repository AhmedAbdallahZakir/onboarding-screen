import 'package:flutter/material.dart';

class IntroScreens extends StatelessWidget {
  IntroScreens({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.urlImage,
  });

  final String firstText;
  final String secondText;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            urlImage,
            height: 327.44,
            width: 347.55,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              firstText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                color: Color(0xff000000),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            secondText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
