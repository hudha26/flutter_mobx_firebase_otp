import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:otp_firebase/views/locator.dart';
import 'package:otp_firebase/views/router.dart';

part 'Auth.g.dart';

class Auth = _Auth with _$Auth;

abstract class _Auth with Store {
  @observable
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @observable
  String _verificationCode;

  @observable
  var otpController = new TextEditingController();

  @action
  void showInSnackBar(String value) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @action
  fireAuth(String otpCode) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: otpCode))
          .then((value) async {
        if (value.user != null) {
          getIt<NavigationService>().navigateTo('/dashboard');
        }
      });
    } catch (e) {
      showInSnackBar('Incorrect code');
    }
  }

  @action
  verify(String phone) async {
    print('run verif()');
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              getIt<NavigationService>().navigateTo('/dashboard');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          } else {
            print('verification Failed');
          }
        },
        codeSent: (String verificationID, int resendToken) {
          _verificationCode = verificationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          _verificationCode = verificationID;
        },
        timeout: Duration(seconds: 60));
  }

  @action
  void verifInit(String phone) async {
    verify(phone);
  }
}
