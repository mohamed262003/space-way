// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class AuthRepo {
//   static Future<void> reloadUserData() async {
//     await FirebaseAuth.instance.currentUser!.reload();
//   }
//
//   static Future<void> logOut() async {
//     await FirebaseAuth.instance.signOut();
//   }
//
//   static Future<void> sendPasswordResetEmail(email) async {
//     final GlobalKey<ScaffoldMessengerState> scaffoldKey =
//         GlobalKey<ScaffoldMessengerState>();
//
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       scaffoldKey.currentState!.showSnackBar(
//         SnackBar(
//           behavior: SnackBarBehavior.floating,
//           duration: const Duration(seconds: 2),
//           backgroundColor: Colors.black,
//           elevation: 2,
//           content: Text(
//             e.message.toString(),
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontFamily: 'Dosis',
//               fontSize: 19,
//               letterSpacing: 1,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       );
//     }
//   }
//
//   static Future<bool> checkOldPassword(email, password) async {
//     AuthCredential authCredential =
//         EmailAuthProvider.credential(email: email, password: password);
//
//     try {
//       var credentialResult = await FirebaseAuth.instance.currentUser!
//           .reauthenticateWithCredential(authCredential);
//       return credentialResult.user != null;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return false;
//     }
//   }
//
//   static Future<void> updateUserPassword(newPassword) async {
//     User user = FirebaseAuth.instance.currentUser!;
//     try {
//       await user.updatePassword(newPassword);
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
// }
