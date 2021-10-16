import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/core/failures/server_failures.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../core/http/pokemon_client.dart';
import '../models/pokemon_model.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonClient client;

  PokemonRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, List<PokemonEntity>>> fetchPokemons(
      int pokemons) async {
    try {
      final List<PokemonEntity> pokemonList = [];

      for (var i = 1; i <= pokemons; i++) {
        final response = await client.get('pokemon/$i');
        pokemonList.add(PokemonModel.fromMap(response.data).toEntity());
      }

      return right(pokemonList);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }

  @override
  Future<Either<ServerFailures, PokemonEntity>> getPokemon(String name) async {
    try {
      final response = await client.get('pokemon/$name');
      final PokemonEntity entity =
          PokemonModel.fromMap(response.data).toEntity();

      return right(entity);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }
}
