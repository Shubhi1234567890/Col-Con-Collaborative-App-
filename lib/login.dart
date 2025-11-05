import 'package:collab_tool/signup_page.dart'; // Assuming this file exists and contains SignupWidget

// Import paths for FlutterFlow generated utilities
import '/auth/firebase_auth/auth_util.dart'; // Assumed to contain AuthUtil
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart'; // Assumed to contain createModel, safeSetState, TransitionInfo, kTransitionInfoKey, PageTransitionType
import '/flutter_flow/flutter_flow_widgets.dart'; // Assumed to contain FFButtonOptions
import 'dart:ui'; // Used for ImageFilter in some FlutterFlow widgets, not directly in this snippet
import '/index.dart'; // Assumed to contain Page1Widget, ForgotPassWidget, etc.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // Often used with FlutterFlow for state management

import 'ff_button_widget.dart'; // Your custom button widget
import 'flutter_flow_theme.dart';
import 'login_model.dart'; // Your login model
export 'login_model.dart'; // Export the model

// --- START: MINIMAL PLACEHOLDER DEFINITIONS FOR COMPILATION (except the removed extension) ---
// In a real FlutterFlow project, these would be in their respective generated files.

// Simplified FlutterFlowModel base class (usually more complex with Provider integration)
abstract class FlutterFlowModel<T extends StatefulWidget> with ChangeNotifier {
  void initState(BuildContext context) {}
  void dispose() {}
}

// Minimal implementation for TransitionInfo and PageTransitionType
class TransitionInfo {
  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;

  TransitionInfo({
    required this.hasTransition,
    required this.transitionType,
    required this.duration,
  });
}

enum PageTransitionType { fade, scale, slide, custom }

// Placeholder for auth_util.dart functionality (mocks Firebase Auth)
class AuthUtil {
  static final AuthUtil instance = AuthUtil._internal();
  AuthUtil._internal();

  Future<dynamic> signInWithEmail(BuildContext context, String email, String password) async {
    print('AuthUtil: Attempting sign-in with email: $email');
    // Implement actual Firebase Auth logic here, e.g.:
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    //   return userCredential.user;
    // } catch (e) {
    //   print('Sign-in error: $e');
    //   // Show error message
    //   return null;
    // }
    // For now, simulate success/failure
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    if (email == 'test@example.com' && password == 'password') {
      print('AuthUtil: Sign-in success (simulated)');
      return 'SimulatedUserObject'; // Return a non-null object for success
    } else {
      print('AuthUtil: Sign-in failed (simulated)');
      return null; // Return null for failure
    }
  }

  Future<dynamic> signInWithGoogle(BuildContext context) async {
    print('AuthUtil: Attempting Google sign-in');
    // Implement actual Firebase Auth Google sign-in logic here, e.g.:
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // if (googleUser == null) return null;
    // final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    // return await FirebaseAuth.instance.signInWithCredential(credential);
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    print('AuthUtil: Google sign-in success (simulated)');
    return 'SimulatedGoogleUserObject'; // Return a non-null object for success
  }

  void prepareAuthEvent() {
    // Often used by FlutterFlow for internal auth state handling before navigation
    print('AuthUtil: prepareAuthEvent called');
  }
}

// Global constant, typically defined in flutter_flow_util.dart
const String kTransitionInfoKey = 'transitionInfoKey';

// Simplified createModel function, usually from flutter_flow_util.dart
T createModel<T extends FlutterFlowModel>(BuildContext context, T Function() factory) {
  final model = factory();
  model.initState(context); // Call initState on the new model
  return model;
}

// Simplified safeSetState, usually from flutter_flow_util.dart
void safeSetState(VoidCallback fn) {
  // In a real State class, this often checks `if (mounted) { setState(fn); }`
  // For this standalone context, we'll just execute it.
  fn();
}

// Minimal placeholder definitions for other route widgets
class Page1Widget extends StatelessWidget {
  const Page1Widget({super.key});
  static String routeName = 'Page1';
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Page 1')), body: const Center(child: Text('Welcome to Page 1')));
}

class ForgotPassWidget extends StatelessWidget {
  const ForgotPassWidget({super.key});
  static String routeName = 'ForgotPassword';
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Forgot Password')), body: const Center(child: Text('Forgot Password Page')));
}

// Ensure signup_page.dart contains a SignupWidget class for import to work
// Example:
// class SignupWidget extends StatelessWidget {
//   const SignupWidget({super.key});
//   static String routeName = 'Signup';
//   @override
//   Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Sign Up')), body: const Center(child: Text('Sign Up Page')));
// }
// --- END: MINIMAL PLACEHOLDER DEFINITIONS FOR COMPILATION ---


// --- START: LOGIN MODEL ---
// login_model.dart (assuming this is a separate file)
class LoginModel extends FlutterFlowModel<LoginWidget> {
  // State fields for stateful widgets in this page.
  final unfocusNode = FocusNode(); // Added for GestureDetector's unfocus
  late TextEditingController t1TextController;
  late FocusNode t1FocusNode;
  String? Function(BuildContext, String?)? t1TextControllerValidator;

  late TextEditingController passwordTextController;
  late FocusNode passwordFocusNode;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    t1TextController = TextEditingController();
    t1FocusNode = FocusNode();
    passwordTextController = TextEditingController();
    passwordFocusNode = FocusNode();
    passwordVisibility = false; // Initialize visibility
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    t1TextController.dispose();
    t1FocusNode.dispose();
    passwordTextController.dispose();
    passwordFocusNode.dispose();
  }
}
// --- END: LOGIN MODEL ---


// --- START: MAIN LOGIN WIDGET CODE ---
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = '/Login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model; // Correctly typed instance of the model

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel()); // Use the helper function

    _model.t1TextController ??= TextEditingController();
    _model.t1FocusNode ??= FocusNode();
    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose(); // Dispose the model which handles its controllers and focus nodes
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.12, -0.86),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                        child: Text(
                          'Welcome Back !',
                          textAlign: TextAlign.start,
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Merienda',
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF56C9CF),
                            fontSize: 32.0, // Ensure double literal
                            letterSpacing: 0.0,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.11, -0.55),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 50, 0),
                        child: SizedBox(
                          width: 250,
                          child: TextFormField(
                            controller: _model.t1TextController,
                            focusNode: _model.t1FocusNode,
                            autofocus: false,
                            autofillHints: const [AutofillHints.email],
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight ?? FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                                color: FlutterFlowTheme.of(context).labelMedium.color ?? FlutterFlowTheme.of(context).primaryText, // Fallback color
                                fontSize: FlutterFlowTheme.of(context).labelMedium.fontSize ?? 14.0, // Fallback font size
                              ),
                              hintText: 'email',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight ?? FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                                color: FlutterFlowTheme.of(context).labelSmall.color ?? FlutterFlowTheme.of(context).primaryText, // Fallback color
                                fontSize: FlutterFlowTheme.of(context).labelSmall.fontSize ?? 12.0, // Fallback font size
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF5A5757),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: const EdgeInsets.all(14),
                              prefixIcon: const Icon(
                                Icons.email,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                              fontFamily: 'Montserrat',
                              color: const Color(0xFF4B4F51),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight ?? FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                              fontSize: FlutterFlowTheme.of(context).labelSmall.fontSize ?? 14.0, // Fallback font size
                            ),
                            textAlign: TextAlign.start,
                            cursorColor:
                            FlutterFlowTheme.of(context).primaryText,
                            validator: _model.t1TextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Container(
                        width: 200,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.27, -0.34),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 50, 0),
                        child: SizedBox(
                          width: 250,
                          child: TextFormField(
                            controller: _model.passwordTextController,
                            focusNode: _model.passwordFocusNode,
                            autofocus: false,
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0, // Ensure double literal
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight ?? FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                                color: FlutterFlowTheme.of(context).labelMedium.color ?? FlutterFlowTheme.of(context).primaryText, // Fallback color
                              ),
                              hintText: 'Password',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight ?? FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                                color: FlutterFlowTheme.of(context).labelMedium.color ?? FlutterFlowTheme.of(context).primaryText, // Fallback color
                                fontSize: FlutterFlowTheme.of(context).labelMedium.fontSize ?? 14.0, // Fallback font size
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF5D5757),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),
                              suffixIcon: InkWell(
                                onTap: () => safeSetState(
                                      () => _model.passwordVisibility =
                                  !_model.passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 22.0, // Ensure double literal
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                              fontFamily: 'Montserrat',
                              color: const Color(0xFF4B4F51),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight ?? FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                              fontSize: FlutterFlowTheme.of(context).labelSmall.fontSize ?? 14.0, // Fallback font size
                            ),
                            cursorColor:
                            FlutterFlowTheme.of(context).primaryText,
                            validator: _model.passwordTextControllerValidator
                                ?.asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Container(
                        width: 200,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.15, -0.06),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 50, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            AuthUtil.instance.prepareAuthEvent();

                            final user = await AuthUtil.instance.signInWithEmail(
                              context,
                              _model.t1TextController.text,
                              _model.passwordTextController.text,
                            );
                            if (user == null) {
                              print('Login Failed');
                              return;
                            }
                            print('Login Success, navigating...');
                            // Assuming FlutterFlow's NavigationExtensions for pushNamedAuth
                            context.pushNamedAuth(Page1Widget.routeName, context.mounted);
                          },
                          text: 'Login',
                          options: FFButtonOptions(
                            width: 250,
                            height: 45,
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: const Color(0xFF56C9CF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 18.0, // Ensure double literal
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight ?? FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0.23),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(130, 0, 130, 0),
                        child: Text(
                          '- OR continue with -',
                          textAlign: TextAlign.end,
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontSize: 12.0, // Ensure double literal
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight ?? FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle, color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.06, 0.36),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(170, 0, 0, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            AuthUtil.instance.prepareAuthEvent();
                            final user =
                            await AuthUtil.instance.signInWithGoogle(context);
                            if (user == null) {
                              print('Google Sign-in Failed');
                              return;
                            }
                            print('Google Sign-in Success, navigating...');
                            // Assuming FlutterFlow's NavigationExtensions for goNamedAuth
                            context.goNamedAuth(Page1Widget.routeName, context.mounted);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/download-removebg-preview.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 2.13),
                      child: Container(
                        width: 50,
                        height: 50,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/images-removebg-preview_(1).png',
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.44, 0.53),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(130, 0, 70, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              SignupWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Text(
                            'Create an account',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                              fontFamily: 'Montserrat',
                              color: const Color(0xFF56C9CF),
                              fontSize: 14.0, // Ensure double literal
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight ?? FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.14, -0.24),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(190, 0, 0, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              ForgotPassWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Montserrat',
                              color: const Color(0xFF56C9CF),
                              fontSize: 12.0, // Ensure double literal
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight ?? FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.98, -0.95),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Container(
                          width: 30,
                          height: 30,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxBoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/Group_34010__1_-removebg-preview.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on String? Function(BuildContext p1, String? p2)? {
  asValidator(BuildContext context) {}
}

class BoxBoxShape {
  static var circle;
}

extension on TextStyle {
  override({required String fontFamily, required double letterSpacing, required FontWeight fontWeight, FontStyle? fontStyle, required Color color, required double fontSize}) {}
}