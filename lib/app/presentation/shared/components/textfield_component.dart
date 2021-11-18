import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  final Iterable<String> Function(TextEditingValue) optionsBuilder;
  final ValueChanged<String> onSelected;
  const TextFieldComponent({
    Key? key,
    required this.optionsBuilder,
    required this.onSelected,
  }) : super(key: key);
  @override
  _TextFieldComponentState createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: widget.onSelected ,
      optionsBuilder: widget.optionsBuilder,
      fieldViewBuilder: (_, controller, focusNode, onEditingComplete) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: const InputDecoration(
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
      },
    );
  }
}
