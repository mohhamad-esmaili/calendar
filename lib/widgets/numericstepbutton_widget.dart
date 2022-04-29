import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final Widget columnTitle;
  int counter = 1;
  ValueChanged<int> onChanged;

  NumericStepButton(
      {Key? key,
      required this.minValue,
      required this.maxValue,
      required this.counter,
      required this.columnTitle,
      required this.onChanged})
      : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.columnTitle,
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: const Color.fromARGB(255, 220, 224, 228), width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.chevron_right,
                ),
                iconSize: 20.0,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    if (widget.counter > widget.minValue) {
                      widget.counter--;
                    }
                    widget.onChanged(widget.counter);
                  });
                },
              ),
              NumberPicker(
                value: widget.counter,
                minValue: widget.minValue,
                maxValue: widget.maxValue,
                itemWidth: 22,
                selectedTextStyle: const TextStyle(
                    fontSize: 20,
                    height: 1,
                    letterSpacing: 0,
                    color: Color.fromARGB(255, 58, 157, 187)),
                textStyle: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(167, 125, 211, 238)),
                axis: Axis.horizontal,
                onChanged: (value) => setState(() => widget.counter = value),
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.chevron_back,
                ),
                iconSize: 20.0,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    if (widget.counter < widget.maxValue) {
                      widget.counter++;
                    }
                    widget.onChanged(widget.counter);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
