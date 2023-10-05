import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';
import 'package:nasa_space_apps/model/data.dart';
import 'package:nasa_space_apps/views/auth/login_screen.dart';
import 'package:nasa_space_apps/views/constants.dart';
import 'package:nasa_space_apps/views/detailsview.dart';
import 'package:provider/provider.dart';

import '../providers/id_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Explore',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 40,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                        onPressed: () async {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text(
                                'Log Out',
                                style: TextStyle(
                                  fontFamily: 'Dosis',
                                  letterSpacing: 1,
                                ),
                              ),
                              content: const Text(
                                'Are you sure to log out ?',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Dosis',
                                  letterSpacing: 1,
                                ),
                              ),
                              actions: <CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                      fontFamily: 'Dosis',
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    context.read<IdProvider>().clearCustId();
                                    await Future.delayed(
                                      const Duration(
                                        microseconds: 100,
                                      ),
                                    ).whenComplete(
                                      () {
                                        Get.off(
                                          const LoginScreen(),
                                          transition: Transition.fadeIn,
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontFamily: 'Dosis',
                                      letterSpacing: 1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.logout,
                        ),
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  const Text(
                    'Solar System',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 24,
                      color: Color(0x7cdbf1ff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 370.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40).r,
                child: Swiper(
                  itemCount: planets.length,
                  fade: 0.5,
                  //itemWidth: 150.w,
                  layout: SwiperLayout.DEFAULT,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 20.sp,
                      activeColor: Colors.white,
                      space: 5,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (context, a, b) => DetailsView(
                              planetInfo: planets[index],
                            ),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 90.h),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25).r,
                                ),
                                elevation: 8,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(25).r,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 90.h),
                                      Text(
                                        planets[index].name.toString(),
                                        style: TextStyle(
                                          fontSize: 35.sp,
                                          fontFamily: 'Avenir',
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10).r,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Know more",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontFamily: 'Avenir',
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_rounded,
                                              color: secondaryTextColor,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Hero(
                            tag: planets[index].position,
                            child: Image.asset(
                              planets[index].iconImage.toString(),
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
