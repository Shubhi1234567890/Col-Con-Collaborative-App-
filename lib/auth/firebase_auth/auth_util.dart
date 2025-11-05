import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'; // <<< ADD THIS IMPORT

// This class handles various authentication operations
class AuthUtil {
  static Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      // Step 1: Initialize GoogleSignIn
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Step 2: Start the interactive Google Sign-In flow
      // This will prompt the user to choose a Google account and grant permissions
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // The user cancelled the sign-in process
        print('Google Sign-In cancelled by user.');
        return null;
      }

      // Step 3: Obtain the authentication details from the Google user request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Step 4: Create a new Firebase credential with the Google access token and ID token
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Step 5: Sign in to Firebase with the Google credential
      // This links the Google account to your Firebase project
      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      print('Google Sign-In successful! User: ${userCredential.user?.displayName ?? 'N/A'} (UID: ${userCredential.user?.uid ?? 'N/A'})');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase specific errors (e.g., account already exists with different credential)
      print('Firebase Auth Error during Google Sign-In: ${e.code} - ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In failed: ${e.message}')),
      );
      return null;
    } catch (e) {
      // Handle any other unexpected errors
      print('General Error during Google Sign-In: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In failed unexpectedly. Please try again.')),
      );
      return null;
    }
  }

// You can add other authentication methods here (e.g., signInWithEmail, signOut)
// static Future<void> signOut() async {
//   await FirebaseAuth.instance.signOut();
//   await GoogleSignIn().signOut(); // Important to sign out from Google too
// }
}