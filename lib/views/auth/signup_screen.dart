import 'dart:ui';

import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nasa_space_apps/views/auth/login_screen.dart';
import 'package:rive/rive.dart';

import '../constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late String name;
  late String email;
  late String password;
  late String _uid;
  bool processing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = true;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        try {
          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }

        _uid = FirebaseAuth.instance.currentUser!.uid;

        await FirebaseAuth.instance.currentUser!.updateDisplayName(name);

        await users.doc(_uid).set({
          'cid': _uid,
          'name': name,
          'email': email,
          'password': password,
        });
        _formKey.currentState!.reset();
        await Future.delayed(
          const Duration(microseconds: 100),
        ).whenComplete(
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          ),
        );
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
        if (e.code == 'weak-password') {
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
                'The password provided is too weak.',
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
        } else if (e.code == 'email-already-in-use') {
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
                'The account already exists for that email.',
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
                      SizedBox(height: 100.h),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: 'Limelight',
                          color: Colors.white,
                          fontSize: 40.sp,
                          letterSpacing: 2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Padding(
                        padding: const EdgeInsets.all(10).r,
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'Dosis',
                            color: Colors.white70,
                            letterSpacing: 1.sp,
                          ),

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your username';
                            }
                            if (value.length > 17) {
                              return 'username must be less than 17 character';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                          maxLength: 17,
                          //controller: _namecontroller,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your Username',
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
                        padding: const EdgeInsets.all(10).r,
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
                      SizedBox(height: 15.h),
                      Padding(
                        padding: const EdgeInsets.all(10).r,
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'Dosis',
                            color: Colors.white70,
                            letterSpacing: 2.sp,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            if (value.contains("-")) {
                              return "can't include -";
                            }
                            if (value.length < 5) {
                              return 'weak password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          //controller: _passwordController,
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
                        padding: const EdgeInsets.only(right: 17).r,
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                            onPressed: () {
                              Get.off(
                                const LoginScreen(),
                                transition: Transition.leftToRightWithFade,
                              );
                            },
                            child: Text(
                              "Already have an account? LogIn",
                              style: TextStyle(
                                color: Colors.white70,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Dosis',
                                letterSpacing: 1,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70).r,
                        child: AnimatedButton(
                          duration: 200,
                          shadowDegree: ShadowDegree.dark,
                          height: 40.h,
                          width: 140.w,
                          color: Colors.white70,
                          onPressed: () {
                            processing == true ? null : signUp();
                          },
                          child: processing == true
                              ? SpinKitFadingCube(
                                  color: Colors.black,
                                  size: 18.sp,
                                )
                              : Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontFamily: 'Dosis',
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
