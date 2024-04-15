// // import 'package:flutter/material.dart';
// // import 'package:healthlog/home_screen.dart';
// // import 'package:healthlog/gnavmenu.dart';
// // import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// //
// // class OnBoardingScreen extends StatelessWidget {
// //   const OnBoardingScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = Get.put(OnBoardingController());
// //
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Stack(
// //           children: [
// //             //horizontal scroll pages
// //             PageView(
// //               children: const [
// //                 OnBoardingPage(
// //                   image: "assets/ob1.png",
// //                   title: "Welcome to Health log",
// //                   subTitle:
// //                       "Where you can keep track of everything health related",
// //                 ),
// //                 OnBoardingPage(
// //                   image: "assets/ob2.png",
// //                   title: "Reminders for everything",
// //                   subTitle:
// //                       "From your medicine times to your next doctor appointment",
// //                 ),
// //                 OnBoardingPage(
// //                   image: "assets/ob3.jpg",
// //                   title: "Easy tracking",
// //                   subTitle:
// //                       "See your vitals in an improved way with statistics",
// //                 ),
// //               ],
// //             ),
// //             //skip button
// //             Positioned(
// //                 right: 24,
// //                 child: TextButton(
// //                   onPressed: () {},
// //                   child: const Text("Skip"),
// //                 )),
// //
// //             // dot navigation //smooth page indicator
// //             Positioned(
// //                 bottom: 38,
// //                 left: 24,
// //                 child: SmoothPageIndicator(
// //                     controller: PageController(), count: 3,
// //                 effect: ExpandingDotsEffect(activeDotColor: Theme.of(context).primaryColor , dotHeight: 8),
// //                 )),
// //             //circular button
// //         Positioned(
// //           bottom: 24,
// //             right: 24,
// //             child: ElevatedButton(
// //                 style: ElevatedButton.styleFrom(shape: CircleBorder(),
// //                 backgroundColor: Theme.of(context).primaryColor,
// //                 foregroundColor: Colors.white),
// //                 onPressed: (){}, child: Icon(Icons.arrow_forward_ios_rounded)))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class OnBoardingPage extends StatelessWidget {
// //   const OnBoardingPage({
// //     super.key,
// //     required this.image,
// //     required this.title,
// //     required this.subTitle,
// //   });
// //
// //   final String image, title, subTitle;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         Image(
// //           image: AssetImage(image),
// //         ),
// //         Text(
// //           title,
// //           style: Theme.of(context).textTheme.headlineMedium,
// //         ),
// //         const SizedBox(
// //           height: 30,
// //         ),
// //         Text(
// //           subTitle,
// //         ),
// //       ],
// //     );
// //   }
// // }
// //Code with t ^ till 11:44 ta'reban
//
// import 'package:flutter/material.dart';
// import 'package:healthlog/home_screen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class OnBoardingView extends StatefulWidget {
//   const OnBoardingView({super.key});
//
//   @override
//   State<OnBoardingView> createState() => _OnBoardingViewState();
// }
//
// class _OnBoardingViewState extends State<OnBoardingView> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = OnBoardingItems();
//     final pageController = PageController();
//
//     bool isLastPage = false;
//
//     return Scaffold(
//       bottomSheet: Container(
//         color: Colors.white,
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextButton(
//                 onPressed: () =>
//                     pageController.jumpToPage(controller.items.length - 1),
//                 child: const Text("Skip")),
//
//             //Indicator
//             SmoothPageIndicator(
//               controller: pageController,
//               count: controller.items.length,
//               onDotClicked: (index) => pageController.animateToPage(index,
//                   duration: const Duration(milliseconds: 600),
//                   curve: Curves.easeIn),
//               effect: WormEffect(
//                 activeDotColor: Theme.of(context).primaryColor,
//                 // dotColor: Theme.of(context).splashColor,
//                 dotHeight: 12,
//                 dotWidth: 12,
//               ),
//             ),
//
//             // isLastPage
//                 // ? Container(
//                 //     decoration: BoxDecoration(
//                 //         color: Colors.teal,
//                 //         borderRadius: BorderRadius.circular(8)),
//                 //     width: MediaQuery.of(context).size.width * .9,
//                 //     height: 55,
//                 //     child: TextButton(
//                 //         onPressed: () {
//                 //           Navigator.pushReplacement(
//                 //               context,
//                 //               MaterialPageRoute(
//                 //                   builder: (context) => const homeScreen()));
//                 //         },
//                 //         child: const Text("Get Started")),
//                 //   )
//                 // :
//             ElevatedButton(
//                     onPressed: () => pageController.nextPage(
//                         duration: const Duration(milliseconds: 600),
//                         curve: Curves.easeIn),
//                     child: const Text("Next")),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: PageView.builder(
//             onPageChanged: (int index) => setState(() => isLastPage = (controller.items.length-1 == index)),
//
//             itemCount: controller.items.length,
//             controller: pageController,
//             itemBuilder: (context, index) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(controller.items[index].image),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     controller.items[index].title,
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     controller.items[index].description,
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               );
//             }),
//       ),
//     );
//   }
//
//   Widget getStarted() {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.teal, borderRadius: BorderRadius.circular(8)),
//       width: MediaQuery.of(context).size.width * .9,
//       height: 55,
//       child: TextButton(
//           onPressed: () {
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (context) => const homeScreen()));
//           },
//           child: const Text("Get Started")),
//     );
//   }
// }
//
// class OnBoardingInfo {
//   final String title;
//   final String description;
//   final String image;
//
//   OnBoardingInfo(
//       {required this.title, required this.description, required this.image});
// }
//
// class OnBoardingItems {
//   List<OnBoardingInfo> items = [
//     OnBoardingInfo(
//         title: "Welcome to Health log",
//         description: "Where you can keep track of everything health related",
//         image: "assets/ob1.png"),
//     OnBoardingInfo(
//         title: "Reminders for everything",
//         description: "From your medicine times to your next doctor appointment",
//         image: "assets/ob2.png"),
//     OnBoardingInfo(
//         title: "Easy tracking",
//         description: "See your vitals in an improved way with statistics",
//         image: "assets/ob3.jpg"),
//   ];
// }