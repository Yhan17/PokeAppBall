import '../../domain/entities/pokemon_entity.dart';
import 'ability_model.dart';
import 'move_model.dart';
import 'status_model.dart';
import 'type_model.dart';

class PokemonModel {
  final int id;
  final String name;
  final String image;
  final double height;
  final double weight;
  final List<MoveModel> moves;
  final List<AbilityModel> abilities;
  final List<StatusModel> stats;
  final List<TypeModel> types;

  PokemonModel({
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'height': height,
      'weight': weight,
      'moves': moves.map((x) => x.toMap()).toList(),
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'stats': stats.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromEntity(PokemonEntity entity) {
    return PokemonModel(
      id: entity.id,
      name: entity.name,
      image: entity.image,
      height: entity.height,
      weight: entity.weight,
      moves: entity.moves.map((x) => MoveModel.fromEntity(x)).toList(),
      abilities:
          entity.abilities.map((x) => AbilityModel.fromEntity(x)).toList(),
      stats: entity.stats.map((x) => StatusModel.fromEntity(x)).toList(),
      types: entity.types.map((x) => TypeModel.fromEntity(x)).toList(),
    );
  }

  PokemonEntity toEntity() => PokemonEntity(
        id: id,
        name: name,
        image: image,
        height: height,
        weight: weight,
        moves: moves.map((e) => e.toEntity()).toList(),
        abilities: abilities.map((e) => e.toEntity()).toList(),
        stats: stats.map((e) => e.toEntity()).toList(),
        types: types.map((e) => e.toEntity()).toList(),
      );

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'],
      name: map['name'],
      image: map['sprites']['other']['dream_world']['front_default'],
      height: double.parse(map['height'].toString()),
      weight: double.parse(map['weight'].toString()),
      moves:
          List<MoveModel>.from(map['moves']?.map((x) => MoveModel.fromMap(x))),
      abilities: List<AbilityModel>.from(
          map['abilities']?.map((x) => AbilityModel.fromMap(x))),
      stats: List<StatusModel>.from(
          map['stats']?.map((x) => StatusModel.fromMap(x))),
      types:
          List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x))),
    );
  }
}
