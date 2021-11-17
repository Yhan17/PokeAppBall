import 'package:flutter/material.dart';
import 'package:pokeappball/app/domain/entities/ability_entity.dart';
import 'package:pokeappball/app/domain/entities/move_entity.dart';
import 'texticon_row_component.dart';
import 'mycustom_chip_component.dart';

class RoundContainer extends StatefulWidget {
  final List<AbilityEntity> abilities;
  final double height;
  final double weight;
  final List<MoveEntity> moves;

  const RoundContainer({
    Key? key,
    required this.abilities,
    required this.height,
    required this.weight,
    required this.moves,
  }) : super(key: key);

  @override
  _RoundContainerState createState() => _RoundContainerState();
}

class _RoundContainerState extends State<RoundContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(62),
            topRight: Radius.circular(62),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 42, right: 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const TextIconRow(
                icon: Icon(
                  Icons.local_fire_department,
                  color: Colors.white,
                  size: 25,
                ),
                text: 'Habilidades',
                color: Color(0xFF9A1F29),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    //Valores da row são ficticios para teste
                    child: Wrap(
                      spacing: 2,
                      children: List<Widget>.generate(
                        widget.abilities.length,
                        (int idx) {
                          return MyCustomChip(
                            color: const Color(0xFF282828),
                            text: widget.abilities[idx].name,
                          );
                        },
                      ).toList(),
                    )),
              ),
              const SizedBox(height: 10),
              const TextIconRow(
                icon: Icon(
                  Icons.directions_run,
                  color: Colors.white,
                  size: 25,
                ),
                text: 'Movimentos',
                color: Color(0xFF5EBF62),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 2,
                  runSpacing: 5,
                  children: List<Widget>.generate(
                    widget.moves.length,
                    (int idx) {
                      if (idx % 2 == 0) {
                        return MyCustomChip(
                          color: const Color(0xFF282828),
                          text: widget.moves[idx].name,
                        );
                      }
                      return MyCustomChip(
                        color: const Color(0xFF5EBF62),
                        text: widget.moves[idx].name,
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 10),
              const TextIconRow(
                icon: Icon(
                  Icons.fitness_center,
                  color: Colors.white,
                  size: 25,
                ),
                text: 'Fisíco',
                color: Colors.blue,
              ),
              const SizedBox(height: 5),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Altura\n\n(${widget.height / 10} m)',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                            Text(
                              'Peso\n\n(${widget.weight / 10} kg)',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
