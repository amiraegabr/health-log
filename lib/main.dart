import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthlog/firebase_options.dart';
import 'package:healthlog/screens/splash.dart';
import 'themes.dart';


Future<void> _initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
void main() async{
  // firebase initialization
  await _initFirebase();
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
      home:  const SplashScreen(),
    );
  }
}