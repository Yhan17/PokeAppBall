import '../../domain/entities/type_entity.dart';

class TypeModel {
  final String name;
  final String url;
  const TypeModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory TypeModel.fromEntity(TypeEntity entity) {
    return TypeModel(
      name: entity.name,
      url: entity.url,
    );
  }

  TypeEntity toEntity() => TypeEntity(name: name, url: url);

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      name: map['type']['name'],
      url: map['type']['url'],
    );
  }
}