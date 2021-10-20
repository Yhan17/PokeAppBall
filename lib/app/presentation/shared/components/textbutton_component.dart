import 'package:flutter/material.dart';
import 'package:pokeappball/app/presentation/shared/theme/app_typohraphy.dart';

class TextButtonComponent extends StatefulWidget {
  final String text;
  final Color color;

  const TextButtonComponent({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  @override
  TextButtonComponentState createState() => TextButtonComponentState();
}

class TextButtonComponentState extends State<TextButtonComponent> {
  Color mainColor = const Color(0xFF5EBF62);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: TextButton(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.text,
                style: AppTypography.textLarge,
              ),
            ),
            onPressed: () {},
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
    );
  }
}
