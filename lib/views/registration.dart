import 'package:achievement_view/achievement_view.dart';
import 'package:animated_button/animated_button.dart';
import 'package:date_picker_timeline/date_picker_widget.dart' as date;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/radio_list_tile/gf_radio_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:intl/intl.dart';
import 'package:nasa_space_apps/model/data.dart';
import 'package:nasa_space_apps/views/confirm_trip.dart';
import 'package:provider/provider.dart';
import '../providers/variables_provider.dart';

class Registration extends StatefulWidget {
  final String planetName;
  final double planetPrice;
  final int planetDuration;
  final int planetProgram;
  final int planetNumber;
  const Registration({
    super.key,
    required this.planetName,
    required this.planetPrice,
    required this.planetDuration,
    required this.planetProgram,
    required this.planetNumber,
  });

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  @override
  Widget build(BuildContext context) {
    //double price = widget.planetPrice!;
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Consumer<VariableProvider>(
          builder: (context, variableProvider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                Get.back();
                variableProvider.updatePickedDate(false);
                variableProvider.updateDate(DateTime.now());
                variableProvider.updatePickedCurrency(false);
                variableProvider.updateCountryCurrency('EGP');
                variableProvider.updateSelectedHotel(0);
                variableProvider.updateSelectedActivity(-1);
                variableProvider.updateSelectedTransportation(0);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white70,
                size: 18.sp,
              ),
            ),
            title: const Text(
              "Registration",
              style: TextStyle(
                color: Colors.white70,
                fontFamily: 'Dosis',
                letterSpacing: 2,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose your travel date",
                    style: TextStyle(
                      fontFamily: 'Dosis',
                      fontSize: 18.sp,
                      letterSpacing: 2,
                      color: Colors.white70,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                    ).r,
                    child: date.DatePicker(
                      DateTime.now(),
                      height: 80.h,
                      width: 65.w,
                      selectionColor: Colors.white,
                      selectedTextColor: Colors.black,
                      dateTextStyle: TextStyle(
                        fontFamily: 'CinzelDecorative',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      dayTextStyle: TextStyle(
                        fontFamily: 'Dosis',
                        letterSpacing: 2.sp,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      monthTextStyle: TextStyle(
                        fontFamily: 'Dosis',
                        letterSpacing: 2.sp,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      onDateChange: (date) {
                        variableProvider.updatePickedDate(true);
                        variableProvider.updateDate(date);
                        AchievementView(
                          title: "Yeaaah! 🤩",
                          subTitle:
                              "${DateFormat('yyyy-MM-dd').format(date).toString()}  Picked successfully",
                          color: Colors.amberAccent,
                          duration: const Duration(milliseconds: 1000),
                          elevation: 2,
                          icon: const Icon(
                            Icons.tag_faces,
                            color: Colors.black,
                          ),
                          textStyleTitle: const TextStyle(
                              fontFamily: 'Dosis', color: Colors.black),
                          textStyleSubTitle: const TextStyle(
                              fontFamily: 'Dosis', color: Colors.black),
                          borderRadius: BorderRadius.circular(17).r,
                        ).show(context);
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Choose your favourite hotel",
                    style: TextStyle(
                      fontFamily: 'Dosis',
                      fontSize: 18.sp,
                      letterSpacing: 2,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 170.w,
                        height: 57.h,
                        child: GFRadioListTile(
                          type: GFRadioType.basic,
                          value: 1,
                          size: 18.sp,
                          position: GFPosition.start,
                          inactiveBgColor: Colors.white70,
                          color: Colors.grey.shade200,
                          activeBgColor: Colors.black,
                          radioColor: CupertinoColors.white,
                          groupValue: variableProvider.selectedHotel,
                          onChanged: (value) {
                            variableProvider.updateSelectedHotel(value!);
                          },
                          title: Text(
                            'Galaxy Heights Hotel',
                            style: TextStyle(
                              color: CupertinoColors.black,
                              letterSpacing: 1.sp,
                              fontSize: 13.sp,
                              fontFamily: 'Dosis',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170.w,
                        height: 45.h,
                        child: GFRadioListTile(
                          type: GFRadioType.basic,
                          value: 2,
                          size: 18.sp,
                          position: GFPosition.start,
                          inactiveBgColor: Colors.white70,
                          color: Colors.grey.shade200,
                          activeBgColor: Colors.black,
                          radioColor: CupertinoColors.white,
                          groupValue: variableProvider.selectedHotel,
                          onChanged: (value) {
                            variableProvider.updateSelectedHotel(value!);
                          },
                          title: Text(
                            'Stardust Hotel',
                            style: TextStyle(
                              color: CupertinoColors.black,
                              letterSpacing: 1.sp,
                              fontSize: 13.sp,
                              fontFamily: 'Dosis',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  //activities
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Any additional activity ?",
                        style: TextStyle(
                          fontFamily: 'Dosis',
                          fontSize: 18.sp,
                          letterSpacing: 2,
                          color: Colors.white70,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    margin: const EdgeInsets.only(top: 5).r,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: activities.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 170.w,
                          height: 60.h,
                          child: GFRadioListTile(
                            type: GFRadioType.basic,
                            value: index,
                            size: 18.sp,
                            position: GFPosition.start,
                            inactiveBgColor: Colors.white70,
                            color: Colors.grey.shade200,
                            activeBgColor: Colors.black,
                            radioColor: CupertinoColors.white,
                            groupValue: variableProvider.selectedActivity,
                            onChanged: (value) {
                              variableProvider.updateSelectedActivity(value!);
                            },
                            title: Text(
                              activities[index],
                              style: TextStyle(
                                color: CupertinoColors.black,
                                letterSpacing: 1.sp,
                                fontSize: 13.sp,
                                fontFamily: 'Dosis',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //Choose the way of travel
                  SizedBox(height: 10.h),
                  Text(
                    "Transportation options :",
                    style: TextStyle(
                      fontFamily: 'Dosis',
                      fontSize: 18.sp,
                      letterSpacing: 2,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 170.w,
                        height: 45.h,
                        child: GFRadioListTile(
                          type: GFRadioType.basic,
                          value: 1,
                          size: 18.sp,
                          position: GFPosition.start,
                          inactiveBgColor: Colors.white70,
                          activeBgColor: Colors.black,
                          radioColor: CupertinoColors.white,
                          groupValue: variableProvider.selectedTransportation,
                          onChanged: (value) {
                            variableProvider
                                .updateSelectedTransportation(value!);
                          },
                          title: Text(
                            'Elevator ',
                            style: TextStyle(
                              color: Colors.white70,
                              letterSpacing: 1.sp,
                              fontSize: 15.sp,
                              fontFamily: 'Dosis',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "3 - 7 days",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30).r,
                    child: SizedBox(
                      height: 110.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: elevators.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22).r,
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                elevators[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 170.w,
                        height: 45.h,
                        child: GFRadioListTile(
                          type: GFRadioType.basic,
                          value: 2,
                          size: 18.sp,
                          position: GFPosition.start,
                          inactiveBgColor: Colors.white70,
                          activeBgColor: Colors.black,
                          radioColor: CupertinoColors.white,
                          groupValue: variableProvider.selectedTransportation,
                          onChanged: (value) {
                            variableProvider
                                .updateSelectedTransportation(value!);
                          },
                          title: Text(
                            'Space Ship',
                            style: TextStyle(
                              color: Colors.white70,
                              letterSpacing: 1.sp,
                              fontSize: 15.sp,
                              fontFamily: 'Dosis',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "1 - 4 days",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30).r,
                    child: SizedBox(
                      height: 110.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: spaceShips.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22).r,
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                spaceShips[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //check out button
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10).r,
                      child: AnimatedButton(
                        onPressed: () {
                          if (variableProvider.pickedDate == true) {
                            if (variableProvider.selectedHotel == 0) {
                              _scaffoldKey.currentState!.showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.white,
                                  elevation: 2,
                                  content: Text(
                                    'choose a hotel first',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Dosis',
                                      fontSize: 19.sp,
                                      letterSpacing: 1.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              if (variableProvider.selectedTransportation ==
                                  0) {
                                _scaffoldKey.currentState!.showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: Colors.white,
                                    elevation: 2,
                                    content: Text(
                                      'choose transportation option first',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Dosis',
                                        fontSize: 19.sp,
                                        letterSpacing: 1.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                Get.to(
                                  Confirmation(
                                    planetName: widget.planetName,
                                    planetDuration: widget.planetDuration,
                                    planetPrice: widget.planetPrice,
                                    hotel: variableProvider.selectedHotel,
                                    activities:
                                        variableProvider.selectedActivity,
                                    transportation:
                                        variableProvider.selectedTransportation,
                                    planetProgram: widget.planetProgram,
                                    planetNumber: widget.planetNumber,
                                  ),
                                  transition: Transition.rightToLeftWithFade,
                                );
                              }
                            }
                          } else {
                            _scaffoldKey.currentState!.showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.white,
                                elevation: 2,
                                content: Text(
                                  'pick a date first',
                                  textAlign: TextAlign.center,
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
                        width: 300.w,
                        height: 50,
                        color: Colors.white70,
                        enabled: true,
                        shadowDegree: ShadowDegree.dark,
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontFamily: "Dosis",
                            letterSpacing: 3,
                            fontSize: 18.sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
