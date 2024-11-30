import 'package:e_commerce/helper/functions_helper.dart';
import 'package:e_commerce/pages/login_screen.dart';
import 'package:e_commerce/pages/navigation_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (isLogin()) {
        navToPage(context: context, page: const NavigationScreen());
      } else {
        navToPage(context: context, page: const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Color(0xfff1ab0d5),
     
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(

              image: DecorationImage(
                image: AssetImage("assets/images/splash.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
       
        
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: CircularProgressIndicator(
              color: Colors.white
            ),
          ),
        )
       
        ],
      )
    );
  }
}
