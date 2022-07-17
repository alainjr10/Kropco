import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edutive2/screens/update_username_screen.dart';
// import 'package:edutive2/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

// import '../../components/bottom_navigation_bar.dart';
import '../../utils/constants.dart';
// import '../hive_services.dart';

class FirebaseSignupAndSigninService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// SIGN UP
  /// function to sign up a new user with email
  Future<String> signupUserWithEmail(
      String email, String password, String userName) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      user!.updateDisplayName(userName);
      return "Successful Signup";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        debugPrint('An account already exists for that email.');
        return 'An account already exists with that email.';
      } else {
        debugPrint("Login failed with error ${e.message}");
        return 'Login failed: ${e.message}';
      }
    } catch (e) {
      debugPrint(e.toString());
      return "Sorry. An error occured";
    }
    //return "Sign up was successful";
  }

  ///Function to save user details to firestore
  Future<String> saveUserToFirestore(String username, email, phoneNumber,
      double longitude, double latitude) async {
    CollectionReference _users = _firestore.collection('users');
    _users.doc(_auth.currentUser?.uid).set({
      'username': username, // John Doe
      'email': email, // dyce@gmail.com
      'phone_number': phoneNumber, // 677777777
      'latitude': latitude,
      'longitude': longitude,
    }).then((value) {
      debugPrint("User Added");

      return "User Added";
    }).catchError((error) {
      debugPrint("Failed to add user: $error");
      return "Sorry! something happened. Try again later";
    });
    return "User Added";
  }

  ///
  ///
  ///
  ///
  ///
  /// LOGIN
  /// function to sign in with email
  Future<String> signinUserWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Successful Signin";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        return 'Wrong password provided for that user.';
      } else {
        debugPrint("Login failed with error ${e.message}");
        return 'Login failed: ${e.message}';
      }
    } catch (e) {
      debugPrint(e.toString());
      return "Sorry. An error occured";
    }
  }

  // location service
  ///
  ///

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
