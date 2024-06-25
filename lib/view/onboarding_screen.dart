import 'package:flutter/material.dart';
import 'package:sakan_qena/views/home_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/intro_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [
              IntroScreens(
                urlImage: 'assets/Flight Booking-pana.png',
                firstText: 'Enjoy a new experience with us!',
                secondText:
                    "You will be able to reserve any hotel with discounts from tourism companies and free tours if you come from some unions and institutions.",
              ),
              IntroScreens(
                urlImage: 'assets/Flight Booking-bro.png',
                firstText: "Get additional services with your reservation!",
                secondText:
                    " You will get with us on the best services from restaurants,cafes,cinema,... and everything you need in yout tour.",
              ),
              IntroScreens(
                urlImage: 'assets/Subscriber-bro.png',
                firstText: 'Get the best transport companies!',
                secondText:
                    "You will be transferred to your tour through the best transport companies with masterpiece prices.",
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.92),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    // _controller.jumpToPage(2);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  },
                  child: Text('skip',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      )),
                ),
                // dot indicator for 3 pages
                SmoothPageIndicator(
                  effect: const WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 20,
                    dotColor: Color(0xff787880),
                    activeDotColor: Color(0xff007AFF),
                  ),
                  controller: _controller,
                  count: 3,
                ),

                // next
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_right_alt,
                          color: Color(0xff0078FF),
                          size: 24,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_right_alt,
                          color: Color(0xff0078FF),
                          size: 24,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
