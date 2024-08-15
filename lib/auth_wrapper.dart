

import 'package:dar_app/page/discussion/discussion_page.dart';
import 'package:dar_app/page/home/home_page.dart';
import 'package:dar_app/page/welcome/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});
  static String id = 'auth_wrapper';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return const HomePage();
            }
            return const DiscussionPage();
          } else {
            return const Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
        });
  }
}
