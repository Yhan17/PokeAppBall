import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../details/details_page.dart';
import 'widgets/pokemon_card_widget.dart';

import '../../../infra/repositories/pokemon_repository_impl.dart';
import '../../shared/theme/app_typohraphy.dart';
import 'controller/pokemon_list_controller.dart';

class PokemonListPage extends HookWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonController = PokemonListController(
      repository: Get.find<PokemonRepositoryImpl>(),
    );
    useEffect(() {
      pokemonController.fetchPokemons();
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokemons',
          style: AppTypography.textLarge,
        ),
      ),
      body: GetBuilder<PokemonListController>(
        init: pokemonController,
        builder: (controller) {
          if (controller.pokemonList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: controller.pokemonList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      const DetailsPage(),
                      arguments: controller.pokemonList[index],
                    );
                  },
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
                            tag: controller.pokemonList[index].image,
                            child: SizedBox(
                              width: 65,
                              height: 55,
                              child: SvgPicture.network(
                                controller.pokemonList[index].image,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.pokemonList[index].name,
                              style: AppTypography.textLarge,
                            ),
                            Text(
                              '#00${controller.pokemonList[index].id}',
                              style: AppTypography.pokemonId,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
