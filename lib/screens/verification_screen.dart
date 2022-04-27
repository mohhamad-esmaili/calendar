import 'package:flutter/material.dart';

import 'package:calendar/provider/auth.dart';
import 'package:calendar/screens/page_exporter.dart';
import 'package:calendar/widgets/sendbutton_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyScreen extends StatefulWidget {
  static const routeName = '/verify';

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    var deviceSize = MediaQuery.of(context).size;

    final _loadedProvider = Provider.of<Auth>(context, listen: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(
              top: deviceSize.height / 3,
              left: deviceSize.width / 7,
              right: deviceSize.width / 7,
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
                    text: _loadedProvider.username,
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
                      }
                      if (_loadedProvider.hasError) {
                        return "کد وارد شده صحیح نیست";
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
                      inactiveFillColor:
                          const Color.fromRGBO(185, 235, 251, 0.2),
                      selectedColor: const Color.fromRGBO(76, 201, 240, 1),
                      selectedFillColor: const Color.fromRGBO(76, 201, 240, 1),
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      setState(() {
                        _loadedProvider.otp = int.parse(v);
                      });
                    },
                    onChanged: (String value) {},
                  ),
                ),
                const SizedBox(height: 5),
                SendButtonWidget(onPressed: () async {
                  try {
                    print(_loadedProvider.otp);
                    _loadedProvider.hasError = false;
                    await _loadedProvider.verify(
                      _loadedProvider.otp!,
                      () => Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName),
                    );
                  } catch (error) {
                    _loadedProvider.hasError = true;
                    print(_loadedProvider.hasError);
                  }
                }),
                TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName),
                    child: const Text("بازگشت"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
