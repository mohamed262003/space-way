import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:nasa_space_apps/views/thanks_screen.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:uuid/uuid.dart';
import '../model/constant.dart';
import '../model/data.dart';
import '../providers/variables_provider.dart';
import 'constants.dart';

class Confirmation extends StatefulWidget {
  final String planetName;
  final int transportation;
  final int planetProgram;
  final int planetNumber;
  final int activities;
  final int hotel;
  final double planetPrice;
  final int planetDuration;
  const Confirmation({
    super.key,
    required this.planetName,
    required this.transportation,
    required this.planetPrice,
    required this.hotel,
    required this.planetDuration,
    required this.activities,
    required this.planetProgram,
    required this.planetNumber,
  });

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  late String orderId;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    orderId = const Uuid().v4();
  }

  @override
  Widget build(BuildContext context) {
    double price = widget.planetPrice;
    // orderId = const Uuid().v4();
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Confirmation",
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'Dosis',
              letterSpacing: 2,
            ),
          ),
        ),
        body: Consumer<VariableProvider>(
          builder: (context, variableProvider, child) {
            return Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TicketWidget(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    bottom: 5,
                  ).r,
                  width: double.infinity,
                  height: 380.h,
                  isCornerRounded: true,
                  margin: const EdgeInsets.only(top: 20).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Travel Ticket",
                                style: TextStyle(
                                  fontSize: 19.sp,
                                  fontFamily: 'Dosis',
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                FirebaseAuth.instance.currentUser!.displayName
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'CinzelDecorative',
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 35,
                                ).r,
                                child: Row(
                                  children: [
                                    Text(
                                      "Distination : ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      widget.planetName,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Text(
                                    "Duration : ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontFamily: 'Dosis',
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "${widget.planetDuration.toString()} ${widget.planetDuration == 1 ? "hour" : "hours"}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontFamily: 'Dosis',
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Text(
                                    "Hotel : ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontFamily: 'Dosis',
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Text(
                                    widget.hotel == 1
                                        ? "Galaxy Heights Hotel"
                                        : "Stardust Hotel",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Dosis',
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 13,
                                  left: 14,
                                ).r,
                                child: Row(
                                  children: [
                                    Text(
                                      "Transport : ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      widget.transportation == 1
                                          ? "Elevator"
                                          : "Space Ship",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 5,
                                ).r,
                                child: Row(
                                  children: [
                                    Text(
                                      "Activity : ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      variableProvider.selectedActivity == -1
                                          ? "Not Chosen"
                                          : activities[widget.activities],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 4,
                                ).r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Program :",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 10,
                                      ).r,
                                      child: SizedBox(
                                        width: 170.w,
                                        height: 70.h,
                                        child: Text(
                                          planets[widget.planetNumber - 1]
                                              .places![widget.planetProgram],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontFamily: 'Dosis',
                                            letterSpacing: 2,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              QrImageView(
                                data: orderId,
                                version: QrVersions.auto,
                                backgroundColor: Colors.white,
                                gapless: true,
                                size: 130.r,
                                errorStateBuilder: (cxt, err) {
                                  return const Center(
                                    child: Text(
                                      'error',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState2) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Price : ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                          fontFamily: 'Dosis',
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      SizedBox(height: 7.h),
                                      Text(
                                        "$price ${variableProvider.countryCurrency}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'Dosis',
                                          overflow: TextOverflow.ellipsis,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            onPressed: variableProvider
                                                    .pickedCurrency
                                                ? () {}
                                                : () {
                                                    showCurrencyPicker(
                                                      context: context,
                                                      showFlag: true,
                                                      showCurrencyName: true,
                                                      showSearchField: true,
                                                      showCurrencyCode: true,
                                                      favorite: [
                                                        'EGP',
                                                        'USD',
                                                        'EUR',
                                                      ],
                                                      theme:
                                                          CurrencyPickerThemeData(
                                                        flagSize: 25,
                                                        titleTextStyle:
                                                            TextStyle(
                                                          fontSize: 15.sp,
                                                        ),
                                                        subtitleTextStyle:
                                                            TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Theme.of(context)
                                                                  .hintColor,
                                                        ),
                                                        bottomSheetHeight:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1.5,
                                                      ),
                                                      onSelect:
                                                          (Currency currency) {
                                                        variableProvider
                                                            .updatePickedCurrency(
                                                                true);
                                                        switch (currency.code) {
                                                          case 'USD':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToUSD;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'USD');
                                                            break;
                                                          case 'EUR':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToEUR;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'EUR');
                                                            break;
                                                          case 'JPY':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToJPY;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'JPY');
                                                            break;
                                                          case 'GBP':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToGBP;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'GBP');
                                                            break;
                                                          case 'AUD':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToAUD;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'AUD');
                                                            break;
                                                          case 'CAD':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToCAD;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'CAD');
                                                            break;
                                                          case 'CHF':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToCHF;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'CHF');
                                                            break;
                                                          case 'CNY':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToCNY;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'CNY');
                                                            break;
                                                          case 'HKD':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToHKD;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'HKD');
                                                            break;
                                                          case 'NZD':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToNZD;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'NZD');
                                                            break;
                                                          case 'SEK':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToSEK;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'SEK');
                                                            break;
                                                          case 'KRW':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToKRW;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'KRW');
                                                            break;
                                                          case 'SGD':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToSGD;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'SGD');
                                                            break;
                                                          case 'NOK':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToNOK;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'NOK');
                                                            break;
                                                          case 'MXN':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToMXN;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'MXN');
                                                            break;
                                                          case 'INR':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToINR;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'INR');
                                                            break;
                                                          case 'RUB':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToRUB;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'RUB');
                                                            break;
                                                          case 'ZAR':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToZAR;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'ZAR');
                                                            break;
                                                          case 'TRY':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToTRY;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'TRY');
                                                            break;
                                                          case 'BRL':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToBRL;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'BRL');
                                                            break;
                                                          case 'TWD':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToTWD;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'TWD');
                                                            break;
                                                          case 'DKK':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToDKK;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'DKK');
                                                            break;
                                                          case 'PLN':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToPLN;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'PLN');
                                                            break;
                                                          case 'THB':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToTHB;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'THB');
                                                            break;
                                                          case 'IDR':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToIDR;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'IDR');
                                                            break;
                                                          case 'HUF':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToHUF;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'HUF');
                                                            break;
                                                          case 'AED':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToAED;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'AED');
                                                            break;
                                                          case 'SAR':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToSAR;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'SAR');
                                                            break;
                                                          case 'KWD':
                                                            setState2(() {
                                                              price = price *
                                                                  egpToKWD;
                                                            });
                                                            variableProvider
                                                                .updateCountryCurrency(
                                                                    'KWD');
                                                            break;
                                                        }
                                                      },
                                                    );
                                                  },
                                            child: Text(
                                              "convert\ncurrency",
                                              style: TextStyle(
                                                fontFamily: 'Dosis',
                                                fontSize: 13.sp,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            onPressed: () {
                                              variableProvider
                                                  .updatePickedCurrency(false);
                                              variableProvider
                                                  .updateCountryCurrency('EGP');
                                              setState2(() {
                                                price = widget.planetPrice
                                                    .toDouble();
                                              });
                                            },
                                            child: Icon(
                                              Icons.refresh,
                                              size: 17.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                          bottom: 5,
                        ).r,
                        child: Text(
                          "This Ticket is valid maximum 4 days after ${DateFormat('dd-MM-yyyy').format(variableProvider.userDate).toString()}",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'Dosis',
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                GFCheckboxListTile(
                  value: variableProvider.isClicked,
                  onChanged: (value) {
                    variableProvider
                        .updateSelectedTerms(!variableProvider.isClicked);
                  },
                  position: GFPosition.start,
                  size: 20.sp,
                  description: Row(
                    children: [
                      Text(
                        "Apply",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor: Colors.grey.shade200,
                                child: SizedBox(
                                  height: 450.h,
                                  width: 290.h,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12).r,
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 445,
                                          child: SingleChildScrollView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            child: Text(
                                              '''The requirements for height and weight for passengers traveling to space can vary depending on the space mission, spacecraft, and space tourism company. As of my last knowledge update in September 2021, there were no strict height or weight limits for space tourists, but there were some general guidelines and considerations:

Weight: Spacecraft have weight limitations due to their design, fuel capacity, and safety considerations. Space tourism companies may impose weight limits to ensure the spacecraft can safely carry passengers and achieve their intended orbit. These limits can vary but are typically in the range of 200 to 250 pounds (90 to 113 kilograms) or less.

Health and Fitness: Passengers should be in reasonably good health and physical condition to endure the physical stresses of space travel. Some companies may require passengers to meet certain health and fitness criteria, such as not having serious medical conditions or being able to withstand the G-forces experienced during launch and re-entry.

Height: There are generally no specific height requirements for space tourists. Spacecraft are designed to accommodate a range of body sizes and shapes, and the seats and restraints can be adjusted to fit passengers of different heights.

It's essential to keep in mind that the space tourism industry is evolving, and the specific requirements and guidelines may change over time. Different companies may have their own criteria and restrictions, so it's crucial to check with the space tourism provider you're interested in for their latest requirements and eligibility criteria.

Additionally, since my knowledge is based on information available up to September 2021, there may have been developments or changes in the industry since then, so it's a good idea to consult the most recent information from reputable space tourism companies or space agencies for the latest requirements and updates.

''',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                letterSpacing: 1.sp,
                                                color: Colors.black,
                                                fontFamily: 'Dosis',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13).r,
                                        ),
                                        child: Text(
                                          "Close",
                                          style: TextStyle(
                                            fontFamily: 'Dosis',
                                            color: Colors.white,
                                            letterSpacing: 1.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Terms of Conditions",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10).r,
                    child: AnimatedButton(
                      onPressed: () async {
                        if (variableProvider.isClicked) {
                          showProgress();
                          CollectionReference orderRef =
                              FirebaseFirestore.instance.collection('trips');

                          await orderRef.doc(orderId).set({
                            'cid': FirebaseAuth.instance.currentUser!.uid,
                            'custname':
                                FirebaseAuth.instance.currentUser!.displayName,
                            'email': FirebaseAuth.instance.currentUser!.email,
                            'distination': widget.planetName,
                            'duration': widget.planetDuration,
                            'hotel': widget.hotel == 1
                                ? "Galaxy Heights Hotel"
                                : "Stardust Hotel",
                            'tripId': orderId,
                            'tripPrice': widget.planetPrice,
                            'tripDate': DateFormat('dd-MM-yyyy')
                                .format(variableProvider.userDate)
                                .toString(),
                            'deliverystatus': 'preparing',
                            'orderrate': 0,
                            'paymentstatus': 'cash on flight',
                            'tripreview': false,
                          });
                          await Future.delayed(
                            const Duration(
                              microseconds: 800,
                            ),
                          ).whenComplete(
                            () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ThanksScreen(),
                                  ),
                                  (route) => false);
                            },
                          );
                        } else {
                          _scaffoldKey.currentState!.showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.white,
                              elevation: 2,
                              content: Text(
                                'you must apply Terms',
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
                        "Check out",
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
            );
          },
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
