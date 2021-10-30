import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomChip extends StatefulWidget {
  final String text;
  final Color color;

  const MyCustomChip({
    Key? key, required this.text, required this.color,
  }) : super(key: key);
  @override
  _MyCustomChipState createState() => _MyCustomChipState();
}

class _MyCustomChipState extends State<MyCustomChip> {
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
