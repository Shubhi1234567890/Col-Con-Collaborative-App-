import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class LoginModel {
  /// Controller for the email TextFormField
  late TextEditingController t1TextController;

  /// FocusNode for the email TextFormField
  late FocusNode t1FocusNode;

  /// Controller for the password TextFormField
  late TextEditingController passwordTextController;

  /// FocusNode for the password TextFormField
  late FocusNode passwordFocusNode;

  /// Visibility toggle for the password field
  bool passwordVisibility;

  LoginModel() :
        passwordVisibility = false {
    t1TextController = TextEditingController();
    t1FocusNode = FocusNode();
    passwordTextController = TextEditingController();
    passwordFocusNode = FocusNode();
  }

  /// Dispose method to clean up controllers and focus nodes
  void dispose() {
    t1TextController.dispose();
    t1FocusNode.dispose();
    passwordTextController.dispose();
    passwordFocusNode.dispose();
  }

  /// Validator for email field
  String? Function(String?)? get t1TextControllerValidator => (value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  };

  /// Validator for password field
  String? Function(String?)? get passwordTextControllerValidator => (value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  };
}