import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipComponent extends StatefulWidget {
  final String text;
  final Color color;

  const ChipComponent({
    Key? key, required this.text, required this.color,
  }) : super(key: key);
  @override
  _ChipComponentState createState() => _ChipComponentState();
}

class _ChipComponentState extends State<ChipComponent> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        widget.text,
        style: const TextStyle(
            color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
      ),
      backgroundColor: widget.color,
    );
  }
}
