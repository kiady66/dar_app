import 'package:dar_app/auth_wrapper.dart';
import 'package:dar_app/page/discussion/discussion_page.dart';
import 'package:dar_app/page/home/home_page.dart';
import 'package:dar_app/page/login/login_page.dart';
import 'package:dar_app/page/signup/signup_page.dart';
import 'package:dar_app/page/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontFamily: 'Ubuntu',
            ),
          ),
      ),
      initialRoute: WelcomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        WelcomePage.id: (context) => const WelcomePage(),
        AuthWrapper.id: (context) => const AuthWrapper(),
        DiscussionPage.id: (context) => const DiscussionPage(),
      },
    );
  }
}