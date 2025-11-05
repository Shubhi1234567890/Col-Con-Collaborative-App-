import 'package:flutter/material.dart';

class SignedupModel {
  // First set of fields
  TextEditingController? t1TextController1;
  FocusNode? t1FocusNode1;

  TextEditingController? passwordTextController1;
  FocusNode? passwordFocusNode1;

  TextEditingController? cpassTextController1;
  FocusNode? cpassFocusNode1;

  // Second set of fields
  TextEditingController? t1TextController2;
  FocusNode? t1FocusNode2;

  TextEditingController? passwordTextController2;
  FocusNode? passwordFocusNode2;

  TextEditingController? cpassTextController2;
  FocusNode? cpassFocusNode2;

  // Validators - nullable functions returning nullable String (error message or null)
  String? Function(String?)? t1TextController1Validator;
  String? Function(String?)? passwordTextController1Validator;
  String? Function(String?)? cpassTextController1Validator;
  String? Function(String?)? cpassTextController2Validator;

  // Password visibility toggles, initialized to false
  bool passwordVisibility1 = false;
  bool cpassVisibility1 = false;
  bool cpassVisibility2 = false;

  SignedupModel({
    this.t1TextController1,
    this.t1FocusNode1,
    this.passwordTextController1,
    this.passwordFocusNode1,
    this.cpassTextController1,
    this.cpassFocusNode1,
    this.t1TextController2,
    this.t1FocusNode2,
    this.passwordTextController2,
    this.passwordFocusNode2,
    this.cpassTextController2,
    this.cpassFocusNode2,
    this.t1TextController1Validator,
    this.passwordTextController1Validator,
    this.cpassTextController1Validator,
    this.cpassTextController2Validator,
    this.passwordVisibility1 = false,
    this.cpassVisibility1 = false,
    this.cpassVisibility2 = false,
  });

  // Dispose all controllers and focus nodes to free up resources
  void dispose() {
    t1TextController1?.dispose();
    t1FocusNode1?.dispose();

    passwordTextController1?.dispose();
    passwordFocusNode1?.dispose();

    cpassTextController1?.dispose();
    cpassFocusNode1?.dispose();

    t1TextController2?.dispose();
    t1FocusNode2?.dispose();

    passwordTextController2?.dispose();
    passwordFocusNode2?.dispose();

    cpassTextController2?.dispose();
    cpassFocusNode2?.dispose();
  }
}
