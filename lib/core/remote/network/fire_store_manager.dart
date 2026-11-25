import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStoreManager {
  static Future<bool> saveUser(
      BuildContext context, {
        required String name,
        required String phone,
        required String email,
        required String password,
        required int avatarIndex,
      }) async {

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = credential.user!;
      await user.updateDisplayName(name);
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': name,
        'phone': phone,
        'email': email,
        'avatarIndex':avatarIndex,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await user.sendEmailVerification();
      if (context.mounted) {
        _show(context, 'Account created. Please check your email and verify it');
      }
      return true;
    } on FirebaseAuthException catch (e) {
      String msg = 'Something went wrong, please try again';
      if (e.code == 'weak-password') {
        msg = 'The password is too weak';
      } else if (e.code == 'email-already-in-use') {
        msg = 'This email is already in use';
      } else if (e.code == 'invalid-email') {
        msg = 'The email address is not valid';
      }
      if (context.mounted) _show(context, msg);
      return false;
    } catch (e) {
      if (context.mounted) _show(context, 'Error: $e');
      return false;
    }
  }

  static void _show(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 4),
        ),
      );
  }

  static Future<bool> login(
      BuildContext context, {
        required String email,
        required String password,
      }) async {
    try {
      final cred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await cred.user!.reload();
      if (!(FirebaseAuth.instance.currentUser?.emailVerified ?? false)) {
        await FirebaseAuth.instance.signOut();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please verify your email first.')),
          );
        }
        return false;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      final msg = (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential')
          ? 'Wrong email or password.'
          : (e.message ?? 'Error');
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(msg)));
      }
      return false;
    }
  }

  static Future<bool> loginWithGoogle(BuildContext context) async {
    try {
      final cred = await FirebaseAuth.instance
          .signInWithProvider(GoogleAuthProvider());
      final user = cred.user!;

      if (cred.additionalUserInfo?.isNewUser ?? false) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({
          'name': user.displayName ?? '',
          'email': user.email ?? '',
          'photo': user.photoURL ?? '',
          'phone': '',
          'avatar': 1,
        });
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message ?? 'Error')));
      }
      return false;
    }
  }

}