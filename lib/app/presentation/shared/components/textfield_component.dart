import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  const TextFieldComponent({
    Key? key,
  }) : super(key: key);
  @override
  _TextFieldComponentState createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          isDense: true, // Added this
          contentPadding: EdgeInsets.all(8),
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          hintText: "Ex: Pikachu",
          fillColor: Colors.white),
    );
  }
}
