import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/userapp/auth/onboardpages/intro_page_1.dart';
import 'package:my_app/userapp/auth/onboardpages/intro_page_2.dart';
import 'package:my_app/userapp/auth/onboardpages/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  PageController pageController = PageController();
  int count = 3;
  bool onLastpages = false;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (page) {
                setState(() {
                  onLastpages = (page == 2);
                });
              },
              children: const [IntroPage1(), IntroPage2(), IntroPage3()],
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    pageController.jumpToPage(count);
                  },
                  child: Text(
                    "Skip>>",
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                  alignment: const Alignment(0.9, 1.10),
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: pageController,
                        count: count,
                        effect: const WormEffect(dotHeight: 5, dotWidth: 20),
                      ),
                      onLastpages
                          ? TextButton(
                              onPressed: () {
                                Get.offAllNamed("/loginpage");
                              },
                              child: Text(
                                "Done >>",
                                style: Theme.of(context).textTheme.bodySmall,
                              ))
                          : TextButton(
                              onPressed: () {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInCirc);
                              },
                              child: Text(
                                "Next>>",
                                style: Theme.of(context).textTheme.bodySmall,
                              )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
