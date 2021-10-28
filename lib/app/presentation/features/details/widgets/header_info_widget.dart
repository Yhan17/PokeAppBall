import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/theme/app_typohraphy.dart';

class HeaderInfoWidget extends StatelessWidget {
  final String pokemonName;
  final int pokemonId;
  const HeaderInfoWidget({
    Key? key,
    required this.pokemonName,
    required this.pokemonId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Text(pokemonName, style: AppTypography.textTitle),
            ),
            Expanded(
              child: Text(
                '#0$pokemonId',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Chip(
          label: Text(
            'Eletric',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFF5EBF62),
        ),
      ],
    );
  }
}
