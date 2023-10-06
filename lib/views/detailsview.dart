import 'package:animated_button/animated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/radio_list_tile/gf_radio_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:nasa_space_apps/model/data.dart';
import 'package:nasa_space_apps/providers/variables_provider.dart';
import 'package:nasa_space_apps/views/constants.dart';
import 'package:provider/provider.dart';
import 'registration.dart';

class DetailsView extends StatefulWidget {
  final PlanetInfo? planetInfo;
  const DetailsView({super.key, this.planetInfo});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Consumer<VariableProvider>(
              builder: (context, variableProvider, child) {
            return Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 30,
                  ).r,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 250.h),
                        Text(
                          widget.planetInfo!.name.toString(),
                          style: TextStyle(
                            fontSize: 50.sp,
                            fontFamily: 'Avenir',
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Solar System",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontFamily: 'Avenir',
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const Divider(color: Colors.white70),
                        SizedBox(height: 10.h),
                        SizedBox(
                          height: 150.h,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Text(
                              widget.planetInfo!.description.toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Avenir',
                                color: contentTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 60,
                            ),
                          ),
                        ),
                        const Divider(color: Colors.white70),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Mass',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Limelight',
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  widget.planetInfo!.mass,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Dosis',
                                    letterSpacing: 2,
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 15.h),
                            Column(
                              children: [
                                Text(
                                  'Gravity',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Limelight',
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${widget.planetInfo!.gravity}',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Dosis',
                                    letterSpacing: 2,
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        (widget.planetInfo!.name == 'Earth')
                            ? Container()
                            : Center(
                                child: Text(
                                  'Distance From Earth : ${widget.planetInfo!.distanceFromEarth} mile',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Limelight',
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Size',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Limelight',
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  '${widget.planetInfo!.size}',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Dosis',
                                    letterSpacing: 2,
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            SizedBox(width: 15.h),
                            Column(
                              children: [
                                Text(
                                  'Temperature',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Limelight',
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${widget.planetInfo!.size}',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Dosis',
                                    letterSpacing: 2,
                                    color: contentTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        const Divider(color: Colors.white70),
                        SizedBox(height: 15.h),
                        Text(
                          "Programmes",
                          style: TextStyle(
                            fontSize: 23.sp,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Avenir',
                            color: contentTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 40,
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsets.only(top: 5).r,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.zero,
                            itemCount: widget.planetInfo!.places!.length,
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
                                  radioColor: Colors.white,
                                  groupValue: variableProvider.selectedProgram,
                                  onChanged: (value) {
                                    variableProvider
                                        .updateSelectedProgram(value!);
                                  },
                                  title: Text(
                                    widget.planetInfo!.places![index],
                                    style: TextStyle(
                                      color: Colors.black,
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
                        SizedBox(height: 15.h),
                        const Divider(color: Colors.white70),
                        SizedBox(height: 15.h),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 23.sp,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Avenir',
                            color: contentTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 40,
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          height: 200.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.planetInfo!.images!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22).r,
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: CachedNetworkImage(
                                    imageUrl: widget.planetInfo!.images![index],
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                    useOldImageOnUrlChange: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Center(
                          child: AnimatedButton(
                            width: 300.w,
                            height: 50,
                            color: Colors.white70,
                            enabled: true,
                            shadowDegree: ShadowDegree.dark,
                            onPressed: () {
                              if (variableProvider.selectedProgram == -1) {
                                _scaffoldKey.currentState!.showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: Colors.white,
                                    elevation: 2,
                                    content: Text(
                                      'choose your program first',
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
                                  Registration(
                                    planetName:
                                        widget.planetInfo!.name.toString(),
                                    planetPrice: widget.planetInfo!.price!,
                                    planetDuration:
                                        widget.planetInfo!.duration!,
                                    planetProgram:
                                        variableProvider.selectedProgram,
                                    planetNumber: widget.planetInfo!.position,
                                  ),
                                  transition: Transition.rightToLeftWithFade,
                                );
                              }
                            },
                            child: Text(
                              "Travel now",
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
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: -70,
                  child: Hero(
                    tag: widget.planetInfo!.position,
                    child: Image.asset(
                      widget.planetInfo!.iconImage.toString(),
                    ),
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: 10.h,
                  child: Text(
                    widget.planetInfo!.position.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 200.sp,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                  color: Colors.white70,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
