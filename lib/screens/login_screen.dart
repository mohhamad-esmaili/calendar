import 'package:calendar/screens/verification_screen.dart';
import 'package:calendar/widgets/sendbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textController = TextEditingController();
  bool _validate = false;
  String _validationError = '';
  bool get _inputValidator {
    final text = _textController.value.text;

    if (text.isEmpty) {
      setState(() {
        _validationError = 'فیلد نمیتواند خالی باشد';
      });
      return true;
    } else if (!text.startsWith('09')) {
      setState(() {
        _validationError = 'شماره باید از 09 شروع شود';
      });
      return true;
    } else if (text.length < 11) {
      setState(() {
        _validationError = 'شماره باید 11 عدد باشد';
      });
      return true;
    }

    return false;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: deviceSize.height / 3,
          left: deviceSize.width / 5,
          right: deviceSize.width / 5,
        ),
        child: Column(
          children: [
            const Text('لطفا شماره‌ی همراه خود را وارد کنید.'),
            const SizedBox(height: 48.0),
            TextField(
              keyboardType: TextInputType.number,
              controller: _textController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              ],
              maxLength: 11,
              decoration: InputDecoration(
                counterText: "",
                errorText: _validate ? _validationError : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                hintText: 'مثال: 09365464786',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24.0),
            SendButtonWidget(
              onPressed: () {
                if (_inputValidator) {
                  setState(() {
                    _validate = true;
                  });
                } else {
                  setState(() {
                    _validate = false;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VerifyScreen(),
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
