import 'package:flutter/material.dart';
import '../theme/app_typohraphy.dart';

class TextButtonComponent extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback? onTap;

  const TextButtonComponent({
    Key? key,
    required this.text,
    required this.color,
    this.onTap,
  }) : super(key: key);
  @override
  TextButtonComponentState createState() => TextButtonComponentState();
}

class TextButtonComponentState extends State<TextButtonComponent> {
  Color mainColor = const Color(0xFF5EBF62);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text,
                  style: AppTypography.textLarge,
                ),
              ),
            ),
          ),
          Positioned(
            right: -25,
            child: Opacity(
                opacity: 0.1,
                child: Center(
                  child: Image.asset(
                    "assets/images/pokebola.png",
                    width: 150,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
