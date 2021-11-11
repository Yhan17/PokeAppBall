import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/core/failures/server_failures.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../../../domain/repositories/pokemon_repository.dart';

class PokemonListController extends GetxController
    with StateMixin<List<PokemonEntity>> {
  final PokemonRepository repository;
  late List<PokemonEntity> pokemonList = [];
  PokemonListController({
    required this.repository,
  });

  Future<void> fetchPokemons() async {
    change(null, status: RxStatus.loading());
    final result = await repository.fetchPokemons(10);
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
        change(null, status: RxStatus.error());
      },
      (pokemonApiList) {
        pokemonList = pokemonApiList;
        change(pokemonList, status: RxStatus.success());
      },
    );
  }
}
