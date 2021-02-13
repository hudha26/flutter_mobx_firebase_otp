// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Auth on _Auth, Store {
  final _$scaffoldKeyAtom = Atom(name: '_Auth.scaffoldKey');

  @override
  GlobalKey<ScaffoldState> get scaffoldKey {
    _$scaffoldKeyAtom.reportRead();
    return super.scaffoldKey;
  }

  @override
  set scaffoldKey(GlobalKey<ScaffoldState> value) {
    _$scaffoldKeyAtom.reportWrite(value, super.scaffoldKey, () {
      super.scaffoldKey = value;
    });
  }

  final _$_verificationCodeAtom = Atom(name: '_Auth._verificationCode');

  @override
  String get _verificationCode {
    _$_verificationCodeAtom.reportRead();
    return super._verificationCode;
  }

  @override
  set _verificationCode(String value) {
    _$_verificationCodeAtom.reportWrite(value, super._verificationCode, () {
      super._verificationCode = value;
    });
  }

  final _$otpControllerAtom = Atom(name: '_Auth.otpController');

  @override
  TextEditingController get otpController {
    _$otpControllerAtom.reportRead();
    return super.otpController;
  }

  @override
  set otpController(TextEditingController value) {
    _$otpControllerAtom.reportWrite(value, super.otpController, () {
      super.otpController = value;
    });
  }

  final _$fireAuthAsyncAction = AsyncAction('_Auth.fireAuth');

  @override
  Future fireAuth(String otpCode) {
    return _$fireAuthAsyncAction.run(() => super.fireAuth(otpCode));
  }

  final _$verifyAsyncAction = AsyncAction('_Auth.verify');

  @override
  Future verify(String phone) {
    return _$verifyAsyncAction.run(() => super.verify(phone));
  }

  final _$_AuthActionController = ActionController(name: '_Auth');

  @override
  void showInSnackBar(String value) {
    final _$actionInfo =
        _$_AuthActionController.startAction(name: '_Auth.showInSnackBar');
    try {
      return super.showInSnackBar(value);
    } finally {
      _$_AuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scaffoldKey: ${scaffoldKey},
otpController: ${otpController}
    ''';
  }
}
