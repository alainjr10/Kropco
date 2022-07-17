// import 'package:edutive2/components/bottom_navigation_bar.dart';
// import 'package:edutive2/screens/signup_and_signin/signin_with_phone.dart';
// import 'package:edutive2/screens/signup_and_signin/signup.dart';
// import 'package:edutive2/services/firebase/signup_and_signin_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kropco/services/auth_service.dart';
import 'package:kropco/views/auth/signup.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../utils/constants.dart';
import '../../widgets/form_fields.dart';
import '../homepage.dart';

class SignInWithEmail extends StatefulWidget {
  static const signInWithEmailScreenID = "/sign_in_with_email_screen";
  const SignInWithEmail({Key? key}) : super(key: key);

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String email = "", password = "", errorMessage = "";
  bool loadingState = false;
  bool isError = false;
  final FirebaseSignupAndSigninService _firebaseAuthService =
      FirebaseSignupAndSigninService();

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
            children: [
              Container(
                color: kPrimaryColor,
                width: double.infinity,
                height: size.height,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: (size.height / 4.5) / 2.5,
                    left: 26.0,
                    right: 26.0,
                  ), // (size.height / 4.5)/2 is to try and get the text as centered as possible
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: kH3TextSyle.copyWith(color: Colors.white54),
                      ),
                      Text(
                        "Login with Email",
                        style: kH2TextSyle.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  width: size.width,
                  margin: EdgeInsets.only(top: size.height / 4.5),
                  //top: size.height / 4.5,
                  child: Container(
                    // width: double.infinity,
                    height: size.height - size.height / 7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35),
                      ),
                    ),
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
                            // TextButton(
                            //   onPressed: () {
                            //     // Navigator.pushNamed(
                            //     //     context,
                            //     //     SignInWithPhoneNumber
                            //     //         .signInWithPhoneScreenId);
                            //   },
                            //   child: Text(
                            //     "OR Login with phone number",
                            //     style: kH4TextSyle.copyWith(
                            //         decoration: TextDecoration.underline,
                            //         color: kPrimaryColor),
                            //   ),
                            // ),

                            /// divider
                            const Divider(
                              height: 25.0,
                            ),
                            Text(
                              "Email:",
                              style:
                                  kH4TextSyle.copyWith(color: Colors.black54),
                            ),

                            /// Email form field
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
                              "Password:",
                              style:
                                  kH4TextSyle.copyWith(color: Colors.black54),
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
                              height: 15.0,
                            ),
                            //forgot password button

                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style:
                                    kH4TextSyle.copyWith(color: Colors.black54),
                              ),
                            ),

                            /// Divider
                            const Divider(
                              height: 15.0,
                            ),

                            ///Display error if available
                            isError
                                ? Text(
                                    errorMessage,
                                    style:
                                        kH5TextSyle.copyWith(color: Colors.red),
                                  )
                                : const SizedBox(),

                            /// Divider
                            const Divider(
                              height: 25.0,
                            ),

                            /// Submit button
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    loadingState = true;
                                  });

                                  /// NNow try to login in user with the firebase auth service
                                  _firebaseAuthService
                                      .signinUserWithEmail(
                                          email.trim(), password.trim())
                                      .then((value) {
                                    if (value == "Successful Signin") {
                                      debugPrint("Login Successful");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return const Home();
                                        }),
                                      );
                                    } else {
                                      debugPrint("Login was not Successful");
                                      setState(() {
                                        loadingState = false;
                                        isError = true;
                                        errorMessage = value;
                                      });
                                    }
                                  });
                                }
                              },
                              child: Text(
                                "Login",
                                style:
                                    kH4TextSyle.copyWith(color: Colors.white),
                              ),
                              style: kPrimaryBtnStyle,
                            ),

                            /// Don't have an account button
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, SignUp.signUpScreenId);
                              },
                              child: Text(
                                "Don't have an account yet? Sign Up",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
