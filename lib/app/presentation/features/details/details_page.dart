import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../domain/entities/pokemon_entity.dart';
import 'widgets/header_info_widget.dart';
import '../../shared/components/round_container_component.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final PokemonEntity pokemon = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Color(0xFF282828)),
              child: Wrap(
                children: [
                  SizedBox(
                    height: 255,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 36, right: 36),
                      child: HeaderInfoWidget(
                        pokemonId: pokemon.id,
                        pokemonName: pokemon.name,
                        types: pokemon.types,
                      ),
                    ),
                  ),
                  RoundContainer(
                    abilities: pokemon.abilities,
                    height: pokemon.height,
                    weight: pokemon.weight,
                    moves: pokemon.moves,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 115),
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: pokemon.image,
                  child: SizedBox(
                    height: 169,
                    width: 134,
                    child: SvgPicture.network(
                      pokemon.image,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
