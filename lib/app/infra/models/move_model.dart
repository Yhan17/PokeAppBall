
import '../../domain/entities/move_entity.dart';

class MoveModel {
  final String name;
  final String url;
  MoveModel({
    required this.name,
    required this.url,
  });

  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory MoveModel.fromEntity(MoveEntity entity) {
    return MoveModel(
      name: entity.name,
      url: entity.url,
    );
  }

  MoveEntity toEntity() => MoveEntity(name: name, url: url);

  factory MoveModel.fromMap(Map<String, dynamic> map) {
    return MoveModel(
      name: map['move']['name'],
      url: map['move']['url'],
    );
  }
}
