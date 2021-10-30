import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeappball/app/domain/entities/type_entity.dart';

import '../../../shared/theme/app_typohraphy.dart';

class HeaderInfoWidget extends StatelessWidget {
  final String pokemonName;
  final int pokemonId;
  final List<TypeEntity> types;

  const HeaderInfoWidget({
    Key? key,
    required this.pokemonName,
    required this.pokemonId,
    required this.types,
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
                '#00$pokemonId',
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
        Wrap(
          spacing: 2,
          children: List<Widget>.generate(
            types.length,
            (int idx) {
              return  Chip(
                label: Text(
                  types[idx].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: const Color(0xFF5EBF62),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}
