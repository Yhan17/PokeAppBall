import '../../domain/entities/status_entity.dart';

class StatusModel {
  final int baseStatus;
  final String name;
  final String url;
  StatusModel({
    required this.baseStatus,
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseStatus': baseStatus,
      'name': name,
      'url': url,
    };
  }

  factory StatusModel.fromEntity(StatusEntity entity) {
    return StatusModel(
      baseStatus: entity.baseStatus,
      name: entity.name,
      url: entity.url,
    );
  }

  StatusEntity toEntity() => StatusEntity(
        baseStatus: baseStatus,
        name: name,
        url: url,
      );

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      baseStatus: map['base_stat'],
      name: map['stat']['name'],
      url: map['stat']['url'],
    );
  }
}
