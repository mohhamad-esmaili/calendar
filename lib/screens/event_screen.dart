import 'package:calendar/widgets/numericstepbutton_widget.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/event';
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final _textController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _deviceSize = MediaQuery.of(context).size;
    BoxDecoration _containerDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: const Color.fromRGBO(194, 199, 204, 1),
        width: 1,
      ),
    );
    bool _validate = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(null),
          color: Colors.black,
        ),
        title: const Text(
          "رویداد جدید",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
                top: _deviceSize.height / 20,
                left: _deviceSize.width / 15,
                right: _deviceSize.width / 15),
            child: Form(
              key: loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 30),
                    decoration: _containerDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "نام رویداد",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _textController,
                          // onSaved: (String? value) {
                          //   return null;
                          // },
                          // onEditingComplete: () {
                          //   setState(() {
                          //     _validate = true;
                          //   });
                          // },
                          validator: (text) {
                            if (text!.isEmpty) {
                              setState(() {
                                _validate = false;
                              });
                              return "این فیلد نمیتواند خالی باشد";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            hintText: "مانند: جشن نوروز",
                            errorText: _validate
                                ? null
                                : "این فیلد نمیتواند خالی باشد",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 233, 235, 238),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 30),
                    decoration: _containerDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NumericStepButton(
                          counter: 2,
                          minValue: 1,
                          maxValue: 59,
                          columnTitle: Text(
                            "دقیقه",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        const Text(
                          ":",
                          style: TextStyle(
                            color: Color.fromARGB(255, 198, 203, 211),
                            fontSize: 20,
                          ),
                        ),
                        NumericStepButton(
                          counter: 0,
                          minValue: 00,
                          maxValue: 23,
                          columnTitle: Text(
                            "ساعت",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        NumericStepButton(
                          counter: 1,
                          minValue: 1,
                          maxValue: 60,
                          columnTitle: const Text(
                            "مدت زمان رویداد (دقیقه)",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _validate
                      ? TextButton(
                          onPressed: () {
                            if (_textController.value.text.isNotEmpty) {
                              print('object');
                            }
                          },
                          child: const Text("ثبت"),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor:
                                const Color.fromRGBO(67, 97, 238, 1),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            if (_textController.value.text.isNotEmpty) {}
                          },
                          child: const Text("ثبت"),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor:
                                const Color.fromRGBO(157, 162, 166, 1),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
