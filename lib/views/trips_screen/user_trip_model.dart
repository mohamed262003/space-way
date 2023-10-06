import 'package:animated_button/animated_button.dart';
import 'package:nasa_space_apps/views/homepage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserTripModel extends StatefulWidget {
  final dynamic order;
  const UserTripModel({Key? key, required this.order}) : super(key: key);

  @override
  State<UserTripModel> createState() => _UserTripModelState();
}

class _UserTripModelState extends State<UserTripModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  late double rate;
  String comment = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3).r,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(right: 20, left: 20, top: 12).r,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(14).r,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Order ID:\n${widget.order['tripId']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        letterSpacing: 1.sp,
                        fontFamily: 'Dosis',
                      ),
                    ),
                    Text(
                      widget.order['tripDate'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        letterSpacing: 1.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Dosis',
                      ),
                    ),
                    Divider(thickness: 1.5.sp),
                    Text(
                      "${widget.order['distination']}",
                      style: TextStyle(
                        fontFamily: 'Dosis',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.sp,
                      ),
                    ),
                    Divider(thickness: 2.sp),
                    SizedBox(height: 10.h),
                    Text(
                      'EGP  '
                      "${widget.order['tripPrice'].toStringAsFixed(2)}",
                      style: TextStyle(
                        fontFamily: 'Dosis',
                        letterSpacing: 2.sp,
                        fontSize: 13.5.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              widget.order['deliverystatus'] == 'delivered' &&
                      widget.order['tripreview'] == false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 10).r,
                      child: Center(
                        child: AnimatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ScaffoldMessenger(
                                key: _scaffoldKey,
                                child: Scaffold(
                                  backgroundColor: Colors.black,
                                  body: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 140,
                                    ).r,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Thanks for using Space Way',
                                              style: TextStyle(
                                                fontFamily: 'Dosis',
                                                fontSize: 18.sp,
                                                letterSpacing: 2.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Icon(
                                              FontAwesomeIcons.faceLaughWink,
                                              color: Colors.white,
                                              size: 17.sp,
                                            ),
                                          ],
                                        ),
                                        RatingBar.builder(
                                          itemBuilder: (context, _) {
                                            return const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            );
                                          },
                                          unratedColor: Colors.white,
                                          onRatingUpdate: (value) {
                                            rate = value;
                                          },
                                          initialRating: 1,
                                          minRating: 1,
                                          updateOnDrag: true,
                                          allowHalfRating: true,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'enter your review',
                                            hintStyle: TextStyle(
                                              fontFamily: 'Dosis',
                                              letterSpacing: 1.2.sp,
                                              color: Colors.white70,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10).r,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white60,
                                                width: 0.5.w,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10).r,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white60,
                                                width: 1.3.w,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10).r,
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontFamily: 'Dosis',
                                            letterSpacing: 0.5.sp,
                                            color: Colors.white,
                                          ),
                                          onChanged: (value) {
                                            comment = value.trim();
                                          },
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AnimatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              width: 100.w,
                                              height: 30.h,
                                              color: Colors.grey.shade500,
                                              child: const Text(
                                                'Cancel',
                                              ),
                                            ),
                                            SizedBox(width: 20.w),
                                            AnimatedButton(
                                              onPressed: () async {
                                                if (comment != "") {
                                                  showProgress();
                                                  await FirebaseFirestore
                                                      .instance
                                                      .runTransaction(
                                                    (transaction) async {
                                                      DocumentReference
                                                          documentReference =
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'trips')
                                                              .doc(
                                                                widget.order[
                                                                    'tripId'],
                                                              );
                                                      transaction.update(
                                                        documentReference,
                                                        {
                                                          'tripreview': true,
                                                          'orderrate': rate,
                                                        },
                                                      );
                                                    },
                                                  );
                                                  await Future.delayed(
                                                    const Duration(
                                                      microseconds: 50,
                                                    ),
                                                  ).whenComplete(
                                                    () {
                                                      Navigator
                                                          .pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const HomePage(),
                                                              ),
                                                              (route) => false);
                                                    },
                                                  );
                                                } else {
                                                  _scaffoldKey.currentState!
                                                      .showSnackBar(
                                                    SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      backgroundColor:
                                                          Colors.white,
                                                      elevation: 2,
                                                      content: Text(
                                                        'please fill all fields',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: 'Dosis',
                                                          fontSize: 19.sp,
                                                          letterSpacing: 1.sp,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                              width: 100.w,
                                              height: 30.h,
                                              color: Colors.grey.shade500,
                                              child: const Text(
                                                'Ok',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          width: 100.w,
                          height: 27.h,
                          color: Colors.grey.shade400,
                          child: const Text(
                            'Write Review',
                          ),
                        ),
                      ),
                    )
                  : (widget.order['tripreview'] == true
                      ? Padding(
                          padding:
                              const EdgeInsets.only(right: 10, bottom: 5).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Rated",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.sp,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "${widget.order['orderrate']}",
                                style: TextStyle(
                                  fontFamily: 'Dosis',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Text(""))
            ],
          ),
        ),
      ),
    );
  }

  void showProgress() {
    ProgressDialog progress = ProgressDialog(context: context);
    progress.show(
      max: 100,
      backgroundColor: Colors.white,
      msg: 'please wait',
      progressType: ProgressType.valuable,
      progressBgColor: Colors.black,
      borderRadius: 30.r,
    );
  }
}
