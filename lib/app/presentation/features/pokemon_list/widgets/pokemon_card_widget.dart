import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/theme/app_typohraphy.dart';

class PokemonCardWidget extends StatelessWidget {
  final String url;
  final String pokemonName;
  final int pokemonId;
  final VoidCallback onTap;
  const PokemonCardWidget({
    Key? key,
    required this.url,
    required this.pokemonName,
    required this.pokemonId,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: .5, color: Color(0xFFC1C1C1)),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Hero(
                tag: 'pokemon_image',
                child: SvgPicture.network(
                  url,
                  height: 65,
                  width: 65,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemonName,
                  style: AppTypography.textLarge,
                ),
                Text(
                  '#0$pokemonId',
                  style: AppTypography.pokemonId,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
