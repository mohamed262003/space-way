import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nasa_space_apps/views/trips_screen/user_trip_model.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final Stream<QuerySnapshot> _tripsStream = FirebaseFirestore.instance
      .collection('trips')
      .where('cid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Trips",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _tripsStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(
                  fontFamily: 'Dosis',
                  color: Colors.white,
                  letterSpacing: 1.sp,
                  fontSize: 15.sp,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitWanderingCubes(
              color: Colors.white,
              size: 40.sp,
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "You don't Have Any Orders !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Dosis",
                  fontSize: 20.sp,
                  color: Colors.white,
                  letterSpacing: 1.sp,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            addSemanticIndexes: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return UserTripModel(
                order: snapshot.data!.docs[index],
              );
            },
          );
        },
      ),
    );
  }
}
