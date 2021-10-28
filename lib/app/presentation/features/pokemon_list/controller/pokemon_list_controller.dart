import 'package:get/get.dart';

import '../../../../domain/core/failures/server_failures.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../../../domain/repositories/pokemon_repository.dart';

class PokemonListController extends GetxController {
  final PokemonRepository repository;
  late List<PokemonEntity> pokemonList = [];

  PokemonListController({
    required this.repository,
  });

  Future<void> fetchPokemons() async {
    final result = await repository.fetchPokemons(40);

    result.fold(
      (failure) {
        switch (failure) {
          case ServerFailures.notFound:
            Get.defaultDialog(
              title: 'Erro ao realizar a requisição',
              middleText: 'Não foram encontrados pokemons',
            );
            break;
          case ServerFailures.serverError:
            Get.defaultDialog(
              title: 'Erro no servidor',
              middleText: 'Ocorreu um erro com a API',
            );
            break;
        }
      },
      (pokemonApiList) => pokemonList = pokemonApiList,
    );

    update();
  }
}
