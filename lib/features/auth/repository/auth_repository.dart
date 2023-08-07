// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:advanced_flutter_todo_app/common/helpers/db_helper.dart';
import 'package:advanced_flutter_todo_app/common/routes/routes.dart';
import 'package:advanced_flutter_todo_app/common/widgets/showDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(auth: FirebaseAuth.instance);
});

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository({
    required this.auth,
  });

  void verifyOtp({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: smsCodeId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      if (!mounted) {
        return;
      }
      DBHelper.createUser(1);
      Navigator.pushNamedAndRemoveUntil(
        context,
        MyRoutes.home,
        (route) => false,
      );
    } on FirebaseAuth catch (e) {
      print(e.toString());
      showAlertDialog(context: context, message: e.toString());
    }
  }

  void sendOtp({
    required BuildContext context,
    required String phone,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showAlertDialog(context: context, message: e.toString());
        },
        codeSent: (smsCodeId, resendCodeId) {
          // DBHelper.createUser(1);
          Navigator.pushNamedAndRemoveUntil(
            context,
            MyRoutes.otp,
            (route) => false,
            arguments: {
              'phone': phone,
              'smsCodeId': smsCodeId,
            },
          );
        },
        codeAutoRetrievalTimeout: (smsCodeId) {},
      );
    } on FirebaseAuth catch (e) {
      print(e.toString());
      showAlertDialog(context: context, message: e.toString());
    }
  }
}
