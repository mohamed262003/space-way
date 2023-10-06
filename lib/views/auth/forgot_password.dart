import 'dart:ui';
import 'package:animated_button/animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Get.back();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text('Forgot Password'),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const RiveAnimation.asset(
              "assets/riveAssets/shapes.riv",
              fit: BoxFit.fill,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                child: const SizedBox(),
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8).r,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'to reset your password\n\nplease enter your email address\nand click on the button below',
                        style: TextStyle(
                          fontFamily: 'Dosis',
                          fontSize: 20.sp,
                          letterSpacing: 1.sp,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 45.h),
                      TextFormField(
                        style:
                            TextStyle(fontFamily: 'Dosis', color: Colors.white),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email';
                          } else if (!value.isValidEmailAddress()) {
                            return 'invalid email';
                          } else if (value.isValidEmailAddress()) {
                            return null;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            fontFamily: 'Dosis',
                            color: Colors.white,
                            letterSpacing: 1.sp,
                          ),
                          hintText: 'enter your email',
                          hintStyle: TextStyle(
                            fontFamily: 'Dosis',
                            color: Colors.white,
                            letterSpacing: 2.sp,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white60,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white60,
                              width: 2.5.w,
                            ),
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                        ),
                      ),
                      SizedBox(height: 70.h),
                      AnimatedButton(
                        duration: 200,
                        shadowDegree: ShadowDegree.dark,
                        height: 40.h,
                        width: 240.w,
                        color: Colors.white,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final GlobalKey<ScaffoldMessengerState>
                                scaffoldKey =
                                GlobalKey<ScaffoldMessengerState>();

                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                email: emailController.text,
                              );
                            } on FirebaseAuthException catch (e) {
                              scaffoldKey.currentState!.showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.black,
                                  elevation: 2,
                                  content: Text(
                                    e.message.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Dosis',
                                      fontSize: 19,
                                      letterSpacing: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }
                            Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                _scaffoldKey.currentState!.showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Colors.black,
                                    elevation: 2,
                                    content: Text(
                                      'Check your Inbox',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Dosis',
                                        fontSize: 19,
                                        letterSpacing: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            Future.delayed(
                              const Duration(milliseconds: 2400),
                              () {
                                Get.back();
                              },
                            );
                          } else {
                            _scaffoldKey.currentState!.showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.black,
                                elevation: 2,
                                content: Text(
                                  'form not valid',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Dosis',
                                    fontSize: 19,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: Center(
                          child: Text(
                            'Send Reset Password Link',
                            style: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension EnailValidator on String {
  bool isValidEmailAddress() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}
