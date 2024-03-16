import 'package:flutter/material.dart';
import 'package:healthlog/splash.dart';
import 'themes.dart';
import 'package:firebase_core/firebase_core.dart';

// Future<void> main() async {
//   // firebase initialization
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     // options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
main(){

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: "Health log",
      home: const SafeArea(
        bottom: false,
          child: SplashScreen(),
      ),
    );
  }
}