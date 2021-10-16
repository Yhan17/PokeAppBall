import '../../domain/entities/ability_entity.dart';

class AbilityModel {
  final String name;
  final String url;
  AbilityModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory AbilityModel.fromEntity(AbilityEntity entity) {
    return AbilityModel(
      name: entity.name,
      url: entity.url,
    );
  }

  AbilityEntity toEntity() => AbilityEntity(name: name, url: url);

  factory AbilityModel.fromMap(Map<String, dynamic> map) {
    return AbilityModel(
      name: map['ability']['name'],
      url: map['ability']['url'],
    );
  }
}
