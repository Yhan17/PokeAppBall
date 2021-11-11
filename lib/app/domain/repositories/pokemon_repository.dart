import 'package:dartz/dartz.dart';

import '../core/failures/server_failures.dart';
import '../entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<ServerFailures, List<PokemonEntity>>> fetchPokemons(int initial, int pokemons);
  Future<Either<ServerFailures, PokemonEntity>> getPokemon(String name);
}
