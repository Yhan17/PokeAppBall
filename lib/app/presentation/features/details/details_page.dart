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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Color(0xFF282828)),
              child: Wrap(
                children: [
                  SizedBox(
                    height: 295,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 64, left: 36, right: 36),
                      child: HeaderInfoWidget(
                        pokemonId: pokemon.id,
                        pokemonName: pokemon.name,
                      ),
                    ),
                  ),
                  const RoundContainer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 50),
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: pokemon.image,
                  child: SvgPicture.network(
                    pokemon.image,
                    width: 180,
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
