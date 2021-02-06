import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OtpScreenPage extends StatelessWidget {
  final String data;
  OtpScreenPage({Key key, @required this.data}) : super(key: key);

  var _otpController = new TextEditingController();

  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffF5820D),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            padding: EdgeInsets.fromLTRB(
                15.0,
                30.0,
                15.0,
                30.0),
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(top: 30.0)),
              Text(
                "Please enter OTP code that just sent to +62$data",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: 30.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinCodeTextField(
                  maxLength: 4,
                  controller: _otpController,
                  autofocus: false,
                  highlightColor: Color(0xffcccccc),
                  defaultBorderColor: Color(0xffcccccc),
                  hasTextBorderColor: Color(0xffF5820D),
                  highlight: true,
                  wrapAlignment: WrapAlignment.center,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                  pinTextStyle:
                      TextStyle(fontSize: 24.0),
                  pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.scalingTransition,
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 200),
                  onTextChanged: (value) {
                    
                  },
                ),
                ],
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: 30.0)),
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
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: (){

              }
            ),
          ))
      ]),
    );
  }
}
