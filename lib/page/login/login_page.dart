import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../components/components.dart';
import '../login/login_page.dart';
import '../signup/signup_page.dart';
import '../welcome/welcome_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TopScreenImage(screenImageName: 'home.jpg'),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const ScreenTitle(title: 'Hello'),
                      const Text(
                        'Welcome to Tasky, where you manage your daily tasks',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Hero(
                        tag: 'login_btn',
                        child: CustomButton(
                          buttonText: 'Login',
                          onPressed: () {
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: 'signup_btn',
                        child: CustomButton(
                          buttonText: 'Sign Up',
                          isOutlined: true,
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpPage.id);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Sign up using',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 25,
                              child: Image.asset(
                                  'assets/images/icons/facebook.png'),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              User? user = await signInWithGoogle();
                              if (context.mounted) {
                                if (user != null) {
                                  Navigator.pushNamed(context, WelcomePage.id);
                                } else {
                                  signUpAlert(
                                    context: context,
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, LoginPage.id);
                                    }, title: 'Error', desc: 'Sign in failed', btnText: 'Try again',
                                  );
                                }
                              }
                            },
                            icon: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child:
                              Image.asset('assets/images/icons/google.png'),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 25,
                              child: Image.asset(
                                  'assets/images/icons/linkedin.png'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}