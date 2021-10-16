import 'package:equatable/equatable.dart';

import 'ability_entity.dart';
import 'move_entity.dart';
import 'status_entity.dart';
import 'type_entity.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final double height;
  final double weight;
  final List<MoveEntity> moves;
  final List<AbilityEntity> abilities;
  final List<StatusEntity> stats;
  final List<TypeEntity> types;
  
  const PokemonEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.moves,
    required this.abilities,
    required this.stats,
    required this.types,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        height,
        weight,
        moves,
        abilities,
        stats,
        types,
      ];
}
