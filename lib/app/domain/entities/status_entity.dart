import 'package:equatable/equatable.dart';

class StatusEntity extends Equatable {
  final int baseStatus;
  final String name;
  final String url;

  const StatusEntity({
    required this.baseStatus,
    required this.name,
    required this.url,
  });

  @override
  List<Object> get props => [
        baseStatus,
        name,
        url,
      ];
}
