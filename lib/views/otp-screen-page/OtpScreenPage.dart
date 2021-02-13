import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:otp_firebase/core/viewmodels/Auth.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OtpScreenPage extends StatelessWidget {
  final Auth auth = Auth();
  final String data;
  OtpScreenPage({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    auth.verifInit('+62$data');
    return Scaffold(
        key: auth.scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xffF5820D),
          ),
          backgroundColor: Colors.white,
        ),
        body: Observer(builder: (_) {
          return Column(children: <Widget>[
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ListView(
                padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Text(
                    "Please enter OTP code that just sent to +62$data",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PinCodeTextField(
                        maxLength: 6,
                        pinBoxHeight: 50.0,
                        pinBoxWidth: 50.0,
                        controller: auth.otpController,
                        autofocus: false,
                        highlightColor: Color(0xffcccccc),
                        defaultBorderColor: Color(0xffcccccc),
                        hasTextBorderColor: Color(0xffF5820D),
                        highlight: true,
                        wrapAlignment: WrapAlignment.center,
                        pinBoxDecoration:
                            ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                        pinTextStyle: TextStyle(fontSize: 24.0),
                        pinTextAnimatedSwitcherTransition:
                            ProvidedPinBoxTextAnimation.scalingTransition,
                        pinTextAnimatedSwitcherDuration:
                            Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Resend",
                        style: TextStyle(
                          color: Color(0xffF5820D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Container(
                child: SizedBox(
              width: double.infinity,
              child: new RaisedButton(
                  padding: EdgeInsets.all(25.0),
                  color: Color(0xffF5820D),
                  child: Text(
                    "Login",
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () async {
                    auth.fireAuth(auth.otpController.text);
                  }),
            ))
          ]);
        }));
  }
}
