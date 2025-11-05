import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

// Import the specific page you are navigating to
import 'package:collab_tool/signup_page.dart'; // Contains SignupWidget

// Essential FlutterFlow utility imports (ensure this file is your single source of truth)
import '/flutter_flow/flutter_flow_util.dart';
import 'login.dart'; // Assuming this is a local file containing LoginWidget
import 'signedup_model.dart'; // Your model for this widget
import 'flutter_flow_theme.dart'; // Your theme file
import 'ff_button_widget.dart'; // Your custom button widget

// Removed 'popup_widget.dart' as it was noted as unused by the button.
// If it's used elsewhere in this file, you may need to add it back.

class SignedupWidget extends StatefulWidget {
  const SignedupWidget({super.key});

  static String routeName = 'signedup';
  static String routePath = '/signedup';

  @override
  State<SignedupWidget> createState() => _SignedupWidgetState();
}

class _SignedupWidgetState extends State<SignedupWidget>
    with TickerProviderStateMixin {
  late SignedupModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late final AnimationController _colController;
  late final AnimationController _conController;
  late final Animation<double> _colAnimation;
  late final Animation<double> _conAnimation;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignedupModel());

    _colController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _colAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: _colController,
        curve: Curves.bounceOut,
      ),
    );
    _conController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _conAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: _conController,
        curve: Curves.bounceOut,
      ),
    );

    Future.delayed(const Duration(milliseconds: 390), () {
      _colController.forward();
      _conController.forward();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _colController.dispose();
    _conController.dispose();
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
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/undefined_image.png'
                      : 'assets/images/undefined_image.png',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.72),
                child: Image.asset(
                  'assets/images/Group_34010__1_-removebg-preview.png',
                  width: 200,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: const Alignment(-0.05, 0.6),
                child: Text(
                  'Want to \nCollaborate?\nHere you go',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.04, 0.73),
                child: Text(
                  'Collaborate & Connect',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.33, -0.42),
                child: RotationTransition(
                  turns: _colAnimation,
                  child: const Text(
                    'COL',
                    style: TextStyle(
                      fontFamily: 'AnticSlab',
                      color: Color(0xFF56E9EA),
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.31, -0.32),
                child: RotationTransition(
                  turns: _conAnimation,
                  child: const Text(
                    'CON',
                    style: TextStyle(
                      fontFamily: 'AnticSlab',
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.04, 0.92),
                child: FFButtonWidget(
                  onPressed: () async {
                    // Using Navigator.push as requested
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupWidget(), // Directly create the widget
                      ),
                    );
                  },
                  text: 'Get Started',
                  options: FFButtonOptions(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: const Color(0xFF56C9CF),
                    textStyle: GoogleFonts.interTight(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    elevation: 2,
                    iconPadding: const EdgeInsetsDirectional.only(
                      start: 8.0,
                      end: 8.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SignedupModel createModel(
      BuildContext context, SignedupModel Function() constructor) {
    return constructor();
  }
}