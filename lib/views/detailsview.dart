import 'package:animated_button/animated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasa_space_apps/model/data.dart';
import 'package:nasa_space_apps/views/constants.dart';
import 'registration.dart';

class DetailsView extends StatefulWidget {
  final PlanetInfo? planetInfo;
  const DetailsView({super.key, this.planetInfo});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
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
                      height: 200.h,
                      width: double.infinity,
                      child: Text(
                        widget.planetInfo!.description.toString(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Avenir',
                          color: contentTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 60,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const Divider(color: Colors.white70),
                    SizedBox(height: 15.h),
                    Text(
                      'Math            ' + widget.planetInfo!.mass.toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Avenir',
                        color: contentTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 60,
                    ),
                    SizedBox(height: 15.h),
                    (widget.planetInfo!.name == 'Earth')
                        ? Container()
                        : Text(''),
                    Text(
                      'Gravity           ' +
                          widget.planetInfo!.gravity.toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Avenir',
                        color: contentTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 60,
                    ),
                    SizedBox(height: 15.h),
                    (widget.planetInfo!.name == 'Earth')
                        ? Container()
                        : Text(
                            'Distance From Earth ' +
                                widget.planetInfo!.distanceFromEarth.toString(),
                            style: TextStyle(
                              fontSize: 15.sp,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'Avenir',
                              color: contentTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 60,
                          ),
                    SizedBox(height: 15.h),
                    Text(
                      'Size                 ' +
                          widget.planetInfo!.size.toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Avenir',
                        color: contentTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 60,
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
                          Get.to(
                            Registration(
                              planetName: widget.planetInfo!.name.toString(),
                              planetPrice: widget.planetInfo!.price!,
                              planetDuration: widget.planetInfo!.duration!,
                            ),
                            transition: Transition.rightToLeftWithFade,
                          );
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
        ),
      ),
    );
  }
}
