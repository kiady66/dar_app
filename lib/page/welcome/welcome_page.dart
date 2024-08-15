import 'package:dar_app/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/components.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthWrapper.id,
        (Route<dynamic> route) => false,
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: const Center(
          child: ScreenTitle(
            title: 'Welcome',
          ),
        ),
      ),
    );
  }
}
