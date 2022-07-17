import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kropco/views/auth/login.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../services/auth_service.dart';
import '../../utils/constants.dart';
import '../../widgets/form_fields.dart';
import '../homepage.dart';

class SignUp extends StatefulWidget {
  static const signUpScreenId = "/sign_up_screen";
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String username = "",
      phoneNumber = "",
      email = "",
      password = "",
      errorMessage = "";
  double latitude = 0.0, longitude = 0.0;
  bool loadingState = false;
  bool isError = false;
  String selectedCountryCode = "+237";
  final FirebaseSignupAndSigninService _firebaseAuthService =
      FirebaseSignupAndSigninService();

  @override
  void initState() {
    super.initState();
    _firebaseAuthService.determinePosition().then((value) {
      latitude = value.latitude;
      longitude = value.longitude;
      debugPrint(
          "The latitude is $latitude and $longitude. it's accuracy ${value.accuracy} ");
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor, //or set color with: Color(0xFF0000FF)
    ));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: LoadingOverlay(
          isLoading: loadingState,
          child: Stack(
            //fit: StackFit.expand,
            children: [
              Container(
                color: kPrimaryColor,
                width: double.infinity,
                height: size.height,
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: kH3TextSyle.copyWith(color: Colors.white54),
                      ),
                      Text(
                        "Sign Up",
                        style: kH2TextSyle.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width,
                margin: EdgeInsets.only(top: size.height / 6.5),
                height: size.height - size.height / 6.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        left: 35.0,
                        right: 35.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username:",
                            style: kH4TextSyle.copyWith(color: Colors.black54),
                          ),

                          /// Username form field
                          UsernameTextFormField(
                            onChangedFunction: (value) {
                              setState(() {
                                username = value;
                              });
                            },
                          ),

                          // divider
                          const Divider(
                            height: 25.0,
                          ),

                          Text(
                            "Email:",
                            style: kH4TextSyle.copyWith(color: Colors.black54),
                          ),

                          // Email form field
                          EmailTextformfield(
                            onChangedFunction: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),

                          /// divider
                          const Divider(
                            height: 25.0,
                          ),
                          Text(
                            "Phone Number:",
                            style: kH4TextSyle.copyWith(color: Colors.black54),
                          ),

                          /// Phone number form field
                          PhoneNumberTextformfield(
                            onChangedFunction: (value) {
                              setState(() {
                                phoneNumber = value;
                              });
                            },
                            formfieldWidth: size.width - 75 - 100,
                            onCodePickerChanged: (e) {
                              setState(() {
                                selectedCountryCode = e.dialCode.toString();
                              });
                              debugPrint(e.dialCode);
                            },
                          ),

                          /// divider
                          const Divider(
                            height: 25.0,
                          ),
                          Text(
                            "Password:",
                            style: kH4TextSyle.copyWith(color: Colors.black54),
                          ),

                          /// Password form field
                          PasswordTextformfield(
                            onChangedFunction: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),

                          /// Divider
                          const Divider(
                            height: 25.0,
                          ),

                          ///Display error if available
                          isError
                              ? Text(
                                  errorMessage,
                                  style:
                                      kH4TextSyle.copyWith(color: Colors.red),
                                )
                              : const SizedBox(),

                          /// Divider
                          const Divider(
                            height: 25.0,
                          ),

                          /// Submit button
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  loadingState = true;
                                });

                                // //authenticate user with phone
                                // await _firebaseAuthService
                                //     .signupUserWithPhone(selectedCountryCode,
                                //         phoneNumber, context, username, size)
                                //     .then((value) {
                                //   Future.delayed(const Duration(seconds: 8),
                                //       () {
                                //     setState(() {
                                //       loadingState = false;
                                //       debugPrint(
                                //           "returned value: ${value.toString()}");
                                //     });
                                //   });
                                // });

                                // /// call the function to sign up the user
                                await _firebaseAuthService
                                    .signupUserWithEmail(
                                  email.trim(),
                                  password.trim(),
                                  username.trim(),
                                )
                                    .then((value) {
                                  /// operations to carry out when sign in is done, or not donw
                                  debugPrint("Value gotten: $value");

                                  /// If sign up is successful
                                  if (value == "Successful Signup") {
                                    debugPrint("Authenticated");

                                    ///Save the new user to users table in firestore
                                    _firebaseAuthService
                                        .saveUserToFirestore(username, email,
                                            phoneNumber, longitude, latitude)
                                        .then((value) {
                                      if (value == "User Added") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return const Home();
                                          }),
                                        );
                                      } else {
                                        setState(() {
                                          loadingState = false;
                                          isError = true;
                                          errorMessage = value;
                                        });
                                      }
                                    });
                                  }

                                  ///if sign up is unsuccessful
                                  else {
                                    debugPrint("Not Authenticated");
                                    setState(() {
                                      isError = true;
                                      errorMessage = value;
                                      loadingState = false;
                                    });
                                  }
                                });
                              }
                            },
                            child: Text(
                              "Sign Up",
                              style: kH4TextSyle.copyWith(color: Colors.white),
                            ),
                            style: kPrimaryBtnStyle,
                          ),

                          /// Submit button
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                SignInWithEmail.signInWithEmailScreenID,
                              );
                            },
                            child: Text(
                              "Already have an account? Login",
                              style:
                                  kH4TextSyle.copyWith(color: Colors.black54),
                            ),
                          ),
                        ],
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
  }
}
