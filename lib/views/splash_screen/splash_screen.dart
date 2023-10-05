import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasa_space_apps/views/auth/login_screen.dart';
import 'package:nasa_space_apps/views/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/id_provider.dart';
import 'moving_eart.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> documentId;
  late String docId = context.read<IdProvider>().getData;

  @override
  void initState() {
    super.initState();
    context.read<IdProvider>().getDocId();
    documentId = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('custid') ?? '';
    }).then((String value) {
      setState(() {
        docId = value;
      });
      return docId;
    });
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.to(
          docId != '' ? const HomePage() : const LoginScreen(),
          transition: Transition.fadeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            MovingEarth(
              animatePosition: EarthAnimation(
                topAfter: -150,
                topBefore: -150,
                leftAfter: -650,
                leftBefore: -800,
                bottomAfter: -150,
                bottomBefore: -150,
              ),
              delayInMs: 1000,
              durationInMs: 2500,
              child: Image.asset("assets/images/earth_home.jpg"),
            ),
            Positioned(
              left: 25,
              bottom: 30,
              right: 25,
              child: Text(
                "Space Way",
                style: TextStyle(
                  fontSize: 35.sp,
                  color: Colors.white70,
                  fontFamily: 'Limelight',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
