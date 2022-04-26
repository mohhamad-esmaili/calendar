import 'dart:html';

import 'package:calendar/screens/home_screen.dart';
import 'package:calendar/widgets/sendbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends StatelessWidget {
  String number;
  VerifyScreen({this.number = '09111111111'});
  static const routeName = '/verify';
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final _textController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: deviceSize.height / 3,
            left: deviceSize.width / 5,
            right: deviceSize.width / 5,
          ),
          child: Column(
            children: [
              Text(
                "کد چهار رقمی ارسال شده به شماره‌ی",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              RichText(
                text: TextSpan(
                  text: number,
                  style: const TextStyle(
                      color: Color.fromRGBO(67, 97, 238, 1), fontSize: 16),
                  children: [
                    TextSpan(
                      text: ' را وارد کنید.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  controller: _textController,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  hintCharacter: '۰',
                  length: 4,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length != 4) {
                      return "باید تمام فیلدها پر شود";
                    } else {
                      return null;
                    }
                  },
                  errorTextDirection: TextDirection.rtl,
                  errorTextSpace: 30,
                  errorTextMargin: const EdgeInsets.symmetric(vertical: 5),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(24),
                    fieldHeight: 57,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveColor: const Color.fromRGBO(76, 201, 240, 1),
                    activeColor: const Color.fromRGBO(76, 201, 240, 1),
                    inactiveFillColor: const Color.fromRGBO(185, 235, 251, 0.2),
                    selectedColor: const Color.fromRGBO(76, 201, 240, 1),
                    selectedFillColor: const Color.fromRGBO(76, 201, 240, 1),
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onChanged: (String value) {},
                ),
              ),
              const SizedBox(height: 5),
              SendButtonWidget(onPressed: () {
                if (_textController.value.text.isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
