import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  
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
      body: SafeArea(
          child: Form(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  decoration: InputDecoration(
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    hintText: "856412345678",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      padding: EdgeInsets.all(20.0),
                      color: Color(0xffF5820D),
                      child: Text(
                        "Continue",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/otpscreen',
                          arguments: _controller.text,
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
