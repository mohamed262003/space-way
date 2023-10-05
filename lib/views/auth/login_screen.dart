import 'dart:ui';
import 'package:animated_button/animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nasa_space_apps/views/auth/signup_screen.dart';
import 'package:nasa_space_apps/views/homepage.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../providers/id_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  late String email;
  late String password;
  bool passwordVisible = true;
  bool processing = false;
  bool sendEmailVerification = false;

  static Future<bool> checkEmailVerification() async {
    try {
      bool emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      return emailVerified == true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  void logIn() async {
    setState(() {
      processing = true;
    });
    Future.delayed(const Duration(seconds: 1), () async {
      if (_formKey.currentState!.validate()) {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          await FirebaseAuth.instance.currentUser!.reload();
          if (await checkEmailVerification()) {
            _formKey.currentState!.reset();
            context
                .read<IdProvider>()
                .setCustId(FirebaseAuth.instance.currentUser!);
            Get.off(
              const HomePage(),
            );
          } else {
            setState(() {
              processing = false;
              sendEmailVerification = true;
            });
            _scaffoldKey.currentState!.showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 2),
                backgroundColor: Colors.black,
                elevation: 2,
                content: Text(
                  'please check your inbox',
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
        } on FirebaseAuthException catch (e) {
          setState(() {
            processing = false;
          });
          _scaffoldKey.currentState!.showSnackBar(
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
      } else {
        setState(() {
          processing = false;
        });
        _scaffoldKey.currentState!.showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            backgroundColor: Colors.black,
            elevation: 2,
            content: Text(
              'please fill all fields',
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.black,
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
              key: _formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 140.h),
                      Text(
                        "Log In",
                        style: TextStyle(
                          fontFamily: 'Limelight',
                          letterSpacing: 2.sp,
                          color: Colors.white,
                          fontSize: 38.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      sendEmailVerification == true
                          ? Center(
                              child: Container(
                                height: 32.h,
                                width: 190.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7).r,
                                ),
                                child: MaterialButton(
                                  onPressed: () async {
                                    _scaffoldKey.currentState!.showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.black,
                                        elevation: 2,
                                        content: Text(
                                          'Sending email verification . . .',
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
                                    try {
                                      await FirebaseAuth.instance.currentUser!
                                          .sendEmailVerification();
                                    } catch (e) {
                                      if (kDebugMode) {
                                        print(e);
                                      }
                                    }
                                    Future.delayed(
                                      const Duration(seconds: 3),
                                    ).whenComplete(
                                      () {
                                        setState(() {
                                          sendEmailVerification == false;
                                        });
                                        _scaffoldKey.currentState!.showSnackBar(
                                          const SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.white,
                                            elevation: 2,
                                            content: Text(
                                              'Check your email now',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Dosis',
                                                fontSize: 19,
                                                letterSpacing: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      'Resend Email Verification',
                                      style: TextStyle(
                                        fontFamily: 'Dosis',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.sp,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(height: 32.h),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ).r,
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'Dosis',
                            color: Colors.white70,
                            letterSpacing: 1.sp,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email ';
                            } else if (value.isValidEmail() == false) {
                              return 'invalid email';
                            } else if (value.isValidEmail() == true) {
                              return null;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          //  controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.white70,
                              letterSpacing: 1.sp,
                            ),
                            labelStyle: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.white70,
                              letterSpacing: 1.sp,
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
                                width: 3.w,
                              ),
                              borderRadius: BorderRadius.circular(10).r,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ).r,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          style: TextStyle(
                            fontFamily: 'Dosis',
                            color: Colors.white70,
                            letterSpacing: 1.sp,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          //   controller: _passwordController,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white70,
                              ),
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.white70,
                              letterSpacing: 1.sp,
                            ),
                            labelStyle: const TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.white70,
                              letterSpacing: 1,
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
                                width: 3.w,
                              ),
                              borderRadius: BorderRadius.circular(10).r,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                /*Get.to(
                                  const ForgotPassword(),
                                  transition: Transition.leftToRight,
                                );*/
                              },
                              child: Text(
                                'Forget Password ?',
                                style: TextStyle(
                                  fontFamily: 'Dosis',
                                  color: Colors.white70,
                                  fontSize: 15.sp,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'Don\'t Have Account? Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Dosis',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15.sp,
                                  color: Colors.white70,
                                ),
                              ),
                              onPressed: () {
                                Get.to(
                                  const SignupScreen(),
                                  transition: Transition.rightToLeftWithFade,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50).r,
                        child: AnimatedButton(
                          duration: 10,
                          enabled: true,
                          shadowDegree: ShadowDegree.dark,
                          height: 40.h,
                          width: 150.w,
                          color: Colors.white70,
                          onPressed: () {
                            processing == true ? null : logIn();
                          },
                          child: processing == true
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontFamily: 'Dosis',
                                    letterSpacing: 1.sp,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^[a-zA-Z0-9\_\.\-]+[a-zA-Z0-9]*[@][a-zA-Z0-9]{2,}[\.][a-zA-Z]{2,3}$')
        .hasMatch(this);
  }
}
