import 'package:flutter/material.dart';
import 'package:healthlog/screens/registrationScreens/signup.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingItems _onBoardingItems = OnBoardingItems();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          onPageChanged: (int page) {
            setState(() {
              _isLastPage = page == _onBoardingItems.items.length - 1;
            });
          },
          itemCount: _onBoardingItems.items.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(_onBoardingItems.items[index].image),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text(
                      _onBoardingItems.items[index].title,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      _onBoardingItems.items[index].description,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                _bottomRow(index),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _bottomRow(int index) {
    if (_isLastPage) {
      return const GetStartedButton();
    } else {
      return SkipNextRow(
        pageController: _pageController,
        onBoardingItems: _onBoardingItems,
      );
    }
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()),
          );
        },
        child: const Text(
          "Get Started",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class SkipNextRow extends StatelessWidget {
  const SkipNextRow({
    super.key,
    required this.pageController,
    required this.onBoardingItems,
  });

  final PageController pageController;
  final OnBoardingItems onBoardingItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //skip to last page
          TextButton(
            onPressed: () => pageController.jumpToPage(onBoardingItems.items.length - 1),
            child: const Text("Skip"),
          ),

          //Indicator
          SmoothPageIndicator(
            controller: pageController,
            count: onBoardingItems.items.length,
            onDotClicked: (index) => pageController.animateToPage(index,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn,
            ),
            effect: WormEffect(
              activeDotColor: Theme.of(context).primaryColor,
              dotHeight: 12,
              dotWidth: 12,
            ),
          ),

          //continue
          ElevatedButton(
            onPressed: () => pageController.nextPage(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).splashColor,
              foregroundColor: Colors.black,
            ),
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}

class OnBoardingInfo {
  final String title;
  final String description;
  final String image;

  OnBoardingInfo({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnBoardingItems {
  List<OnBoardingInfo> items = [
    OnBoardingInfo(
      title: "Welcome to Health log",
      description: "Where you can keep track of everything health related",
      image: "assets/ob1.png",
    ),
    OnBoardingInfo(
      title: "Reminders for everything",
      description: "From your medicine times to your next doctor appointment",
      image: "assets/ob2.png",
    ),
    OnBoardingInfo(
      title: "Easy tracking",
      description: "See your vitals in an improved way with statistics",
      image: "assets/ob3.jpg",
    ),
  ];
}
