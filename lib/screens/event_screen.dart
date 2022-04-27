import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/event';
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    var _deviceSize = MediaQuery.of(context).size;

    BoxDecoration containerDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color.fromRGBO(194, 199, 204, 1), width: 1));
    return Scaffold(
      appBar: AppBar(
        title: const Text("رویداد جدید"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
              top: _deviceSize.height / 10,
              left: _deviceSize.width / 15,
              right: _deviceSize.width / 15),
          child: Form(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: containerDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("نام رویداد"),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: containerDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [const Text("نام رویداد"), TextFormField()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
