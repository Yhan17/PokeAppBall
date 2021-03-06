import 'package:equatable/equatable.dart';

class MoveEntity extends Equatable {
  final String name;
  final String url;
  
  const MoveEntity({
    required this.name,
    required this.url,
  });

  @override
  List<Object> get props => [
        name,
        url,
      ];
}
