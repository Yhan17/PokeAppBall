import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/core/failures/server_failures.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../../../domain/repositories/pokemon_repository.dart';

class PokemonListController extends GetxController {
  final PokemonRepository repository;
  final pokemonList = <PokemonEntity>[].obs;
  final initialLoading = true.obs;
  final pageLoading = false.obs;
  final initial = 1.obs;
  final limit = 10.obs;

  PokemonListController({
    required this.repository,
  });

  Future<void> fetchPokemons({
    GlobalKey<AnimatedListState>? listKey,
  }) async {
    final result = await repository.fetchPokemons(
      initial.value,
      limit.value,
    );
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
      (pokemonApiList) {
        for (var i = 0; i < pokemonApiList.length; i++) {
          pokemonList.add(pokemonApiList[i]);

          if (listKey != null) {
            listKey.currentState!.insertItem(
              pokemonList.length - 1,
              duration: const Duration(milliseconds: 700),
            );
          }
        }
        // if (pokemonList.isEmpty) {
        // }
      },
    );
  }
}
