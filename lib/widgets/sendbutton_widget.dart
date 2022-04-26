import 'package:flutter/material.dart';

class SendButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  SendButtonWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 4,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [
                0.06,
                0.9,
              ],
              colors: [
                Color.fromRGBO(67, 97, 238, 1),
                Color.fromRGBO(76, 201, 240, 1),
              ]),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Container(
            constraints: const BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: const Text(
              'ارسال',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            )),
      ),
      splashColor: Colors.black12,
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }
}
