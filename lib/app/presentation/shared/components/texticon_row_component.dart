import 'package:flutter/material.dart';
import 'package:pokeappball/app/presentation/shared/theme/app_typohraphy.dart';

class TextIconRow extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color color;
  const TextIconRow({Key? key, required this.text, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
              color:color,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: color)),
          child:icon,
        ),
        Text(text, style: AppTypography.textLargeDark),
      ],
    );
  }
}
