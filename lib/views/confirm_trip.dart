import 'package:currency_picker/currency_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:uuid/uuid.dart';

import '../model/constant.dart';
import '../model/data.dart';
import '../providers/variables_provider.dart';
import 'constants.dart';

class Confirmation extends StatefulWidget {
  final String planetName;
  final int transportation;
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
            double price = widget.planetPrice;
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
                  height: 260.h,
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
                                  top: 5,
                                ).r,
                                child: Row(
                                  children: [
                                    Text(
                                      "Distination : ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      widget.planetName,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
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
                                      fontSize: 14.sp,
                                      fontFamily: 'Dosis',
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "${widget.planetDuration.toString()} ${widget.planetDuration == 1 ? "hour" : "hours"}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontFamily: 'Dosis',
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 15,
                                ).r,
                                child: Row(
                                  children: [
                                    Text(
                                      "Hotel : ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
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
                                  top: 10,
                                ).r,
                                child: Row(
                                  children: [
                                    Text(
                                      "Transport : ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
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
                                  top: 10,
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
                                      activities[widget.activities],
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
                                padding: const EdgeInsets.only(top: 10).r,
                                child: Column(
                                  children: [
                                    Text(
                                      "Program :",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                        fontFamily: 'Dosis',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    const Text(""),
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
                                size: 100.r,
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
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Price : ",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                              fontFamily: 'Dosis',
                                              letterSpacing: 1,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            "${widget.planetPrice} ${variableProvider.countryCurrency}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontFamily: 'Dosis',
                                              overflow: TextOverflow.ellipsis,
                                              letterSpacing: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            child: const Text(
                                              "convert",
                                              style: TextStyle(
                                                fontFamily: 'Dosis',
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
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
                                              size: 15.sp,
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
                          bottom: 10,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
