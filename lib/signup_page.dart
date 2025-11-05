import '/auth/firebase_auth/auth_util.dart'; // Corrected import
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart'; // Assuming this provides Page1Widget and LoginWidget if not found elsewhere
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:cloud_firestore/cloud_firestore.dart';

import 'entry_page.dart'; // This is the SignedupWidget
import 'ff_button_widget.dart';
import 'flutter_flow_theme.dart'; // Keeping this as it was in your original, though it's a duplicate of '/flutter_flow/flutter_flow_theme.dart'
import 'signedup_model.dart';
export 'signedup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  static String routeName = 'Signup';
  static String routePath = '/Signup';

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignedupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignedupModel());

    // Consolidate controllers/focus nodes if they are truly duplicates
    // If you intend to have separate ones, ensure they are used distinctly in the UI
    _model.t1TextController1 = TextEditingController(); // Likely for email
    _model.t1FocusNode1 = FocusNode();

    _model.passwordTextController1 = TextEditingController();
    _model.passwordFocusNode1 = FocusNode();

    _model.cpassTextController1 = TextEditingController();
    _model.cpassFocusNode1 = FocusNode();

    // Assuming t1TextController2 etc. were intended to be for the *same* fields
    // If not, and you had duplicate text fields, clarify which ones you want to use.
    // For now, I'm assuming _model.t1TextController1 and _model.passwordTextController1, _model.cpassTextController1 are the primary ones.
    // If t1TextController2 etc. are used, please clarify their purpose.
    // For the purpose of fixing alignment, I'm going to assume t1TextController2 is your email field controller.
    _model.t1TextController2 = TextEditingController(); // Email
    _model.t1FocusNode2 = FocusNode();

    _model.passwordTextController2 = TextEditingController(); // Password (if a second set)
    _model.passwordFocusNode2 = FocusNode();

    _model.cpassTextController2 = TextEditingController(); // Confirm Pass (if a second set)
    _model.cpassFocusNode2 = FocusNode();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.t1TextController1?.dispose();
    _model.t1FocusNode1?.dispose();
    _model.passwordTextController1?.dispose();
    _model.passwordFocusNode1?.dispose();
    _model.cpassTextController1?.dispose();
    _model.cpassFocusNode1?.dispose();

    _model.t1TextController2?.dispose();
    _model.t1FocusNode2?.dispose();

    _model.passwordTextController2?.dispose();
    _model.passwordFocusNode2?.dispose();

    _model.cpassTextController2?.dispose();
    _model.cpassFocusNode2?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView( // Added SingleChildScrollView to prevent overflow if content is too tall
            child: Column( // Changed from Row/Stack to Column for main layout
              mainAxisSize: MainAxisSize.max,
              children: [
                // Text: "Join the canvas of Creativity !"
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 80, 0, 40), // Adjusted padding for top text
                  child: Align(
                    alignment: AlignmentDirectional.center, // Aligns to the start (left)
                    child: Text(
                      'Join the canvas\nof Creativity! 🧩',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                        fontFamily: GoogleFonts.merienda().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF56C9CF),
                        fontSize: 32,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
                // Email Text Field
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60, 0, 50, 20), // Adjusted padding
                  child: Container(
                    width: 250, // Fixed width as per your original
                    child: TextFormField(
                      controller: _model.t1TextController2, // Using t1TextController2 for email
                      focusNode: _model.t1FocusNode2,
                      autofocus: false,
                      autofillHints: [AutofillHints.email],
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle: FlutterFlowTheme.of(context).labelMedium.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.0,
                        ),
                        hintText: 'email',
                        hintStyle: FlutterFlowTheme.of(context).labelSmall.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5D5757),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5D5757),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsets.all(14),
                        prefixIcon: Icon(Icons.email),
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.copyWith(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: Color(0xFF4B4F51),
                        letterSpacing: 0.0,
                      ),
                      textAlign: TextAlign.start,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.t1TextController1Validator.asValidator(context),
                    ),
                  ),
                ),
                // Password Text Field
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60, 0, 50, 20), // Adjusted padding
                  child: Container(
                    width: 250, // Fixed width as per your original
                    child: TextFormField(
                      controller: _model.passwordTextController1,
                      focusNode: _model.passwordFocusNode1,
                      autofocus: false,
                      obscureText: !_model.passwordVisibility1,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle: FlutterFlowTheme.of(context).labelSmall,
                        hintText: 'Password',
                        hintStyle: FlutterFlowTheme.of(context).labelSmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5D5757),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5D5757),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            safeSetState(() {
                              _model.passwordVisibility1 = !_model.passwordVisibility1;
                            });
                          },
                          child: Icon(
                            _model.passwordVisibility1 ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.passwordTextController1Validator.asValidator(context),
                    ),
                  ),
                ),
                // Confirm Password Text Field
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60, 0, 50, 20), // Adjusted padding
                  child: Container(
                    width: 250, // Fixed width as per your original
                    child: TextFormField(
                      controller: _model.cpassTextController1,
                      focusNode: _model.cpassFocusNode1,
                      autofocus: false,
                      obscureText: !_model.cpassVisibility1,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintText: 'Confirm Password',
                        hintStyle: FlutterFlowTheme.of(context).labelSmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5D5757),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF5D5757),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            safeSetState(() {
                              _model.cpassVisibility1 = !_model.cpassVisibility1;
                            });
                          },
                          child: Icon(
                            _model.cpassVisibility1 ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.cpassTextController1Validator.asValidator(context),
                    ),
                  ),
                ),
                // "By clicking the Register button..." text
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60, 0, 50, 20), // Adjusted padding
                  child: Align(
                    alignment: AlignmentDirectional.center, // Aligns to the start (left)
                    child: Text(
                      'By clicking the Register button, you agree \nto the public offer',
                      style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                        fontSize: 11,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
                // Create Account Button
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20), // Center the button horizontally
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.passwordTextController1?.text != _model.cpassTextController1?.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Passwords don\'t match!'),
                          ),
                        );
                        return;
                      }

                      try {
                        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                          email: _model.t1TextController2?.text ?? '',
                          password: _model.passwordTextController1?.text ?? '',
                        );
                        await FirebaseFirestore.instance.collection('colcon').doc(userCredential.user?.uid).set({
                          'email': _model.t1TextController2?.text,
                        });
                        context.pushNamedAuth(Page1Widget.routeName, context.mounted);
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message ?? 'An error occurred'),
                          ),
                        );
                      }
                    },
                    text: 'Create Account',
                    options: FFButtonOptions(
                      width: 250,
                      height: 45,
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      color: Color(0xFF56C9CF),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.copyWith(
                        color: Colors.white,
                      ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10),
                      iconPadding: EdgeInsetsDirectional.zero,
                    ),
                  ),
                ),
                // "- OR continue with -" text
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20), // Center the text horizontally
                  child: Text(
                    '- OR continue with -',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                      fontSize: 12,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                // Google Sign-In Icon
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20), // Center the icon horizontally
                  child: InkWell(
                    onTap: () async {
                      final user = await AuthUtil.signInWithGoogle(context);
                      if (user == null) {
                        return;
                      }
                      context.goNamedAuth(Page1Widget.routeName, context.mounted);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/download-removebg-preview.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // "I already have an account" text
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20), // Center the text horizontally
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed(
                        LoginWidget.routeName,
                        extra: <String, dynamic>{
                          'kTransitionInfoKey': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Text(
                      'I already have an account',
                      style: FlutterFlowTheme.of(context).labelSmall.copyWith(
                        color: Color(0xFF56C9CF),
                        fontSize: 14,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SignedupModel createModel(BuildContext context, SignedupModel Function() constructor) {
    return constructor();
  }

  void safeSetState(Null Function() param0) {
    setState(param0);
  }
}

// These are placeholder classes and extensions from previous turn.
// They are still present here as per your instruction not to remove them.
// Please be aware that these duplicate definitions will likely cause
// compilation errors like "The name 'TransitionInfo' is defined in the libraries..."
// and other unexpected behavior due to conflicts.
class WithEmailAndPassword {} // This class is not used, can be removed

extension on FirebaseAuth {
  // This extension was created due to a potential error in previous context,
  // but createUserWithEmailAndPassword is a direct method on FirebaseAuth instance.
  // This extension is not needed and can be removed.
  // get createUser => null;
}

class Page1Widget {
  static String routeName = 'Page1';
}

class LoginWidget {
  static String routeName = 'Login';
}

class TransitionInfo {
  final bool hasTransition;
  final PageTransitionType transitionType;

  const TransitionInfo({
    this.hasTransition = true,
    this.transitionType = PageTransitionType.fade,
    required Duration duration,
  });
}

enum PageTransitionType {
  fade,
  slide,
}

// Context extension to simulate navigation (e.g., FlutterFlow context extensions)
extension NavigationExtensions on BuildContext {
  void pushNamed(String routeName, {Map<String, dynamic>? extra}) {
    Navigator.pushNamed(this, routeName, arguments: extra);
  }

  void goNamedAuth(String routeName, bool mounted) {
    if (mounted) {
      Navigator.pushReplacementNamed(this, routeName);
    }
  }

  void pushNamedAuth(String routeName, bool mounted) {
    if (mounted) {
      Navigator.pushNamed(this, routeName);
    }
  }
}

// Extension to wrap validators
extension ValidatorExtension on String? Function(String?)? {
  FormFieldValidator<String>? asValidator(BuildContext context) {
    if (this == null) return null;
    return (value) => this!(value);
  }
}

// Dummy implementation of GoRouter.of
class GoRouter {
  static dynamic of(BuildContext context) {
    print('Warning: GoRouter.of(context) called. Ensure GoRouter is properly initialized.');
    return null; // Return null if GoRouter is not set up
  }
}