import 'package:flutter/material.dart';
import 'package:pokeappball/app/presentation/shared/components/texticon_row_component.dart';
import 'package:pokeappball/app/presentation/shared/theme/app_typohraphy.dart';
import 'dart:math';
import 'mycustom_chip_component.dart';

class RoundContainer extends StatefulWidget {
  const RoundContainer({
    Key? key,
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
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(62),
            topRight: Radius.circular(62),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:25, left:42, right: 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const TextIconRow(icon:Icon(Icons.local_fire_department, color: Colors.white,size: 20,),text:'Habilidades',color: Color(0xFF9A1F29),),
              const SizedBox(height: 5),
              SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                //Valores da row são ficticios para teste
                child: Row(
                  children: const [
                    MyCustomChip(color: Color(0xFF282828),text: "static",),
                    MyCustomChip(color: Color(0xFF282828),text: "Lightning-rod",),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const TextIconRow(icon:Icon(Icons.directions_run, color: Colors.white,size: 20,),text:'Movimentos',color: Color(0xFF5EBF62),),
              const SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: const [
                    MyCustomChip(color: Color(0xFF282828),text: "mega-punch",),
                    MyCustomChip(color: Color(0xFF5EBF62),text: "thunder-punch",),
                    MyCustomChip(color: Color(0xFF282828),text: "pay-day",),
                    MyCustomChip(color: Color(0xFF5EBF62),text: "slam",),
                    MyCustomChip(color: Color(0xFF282828),text: "headbutt",),
                    MyCustomChip(color: Color(0xFF5EBF62),text: "growl",),
                    MyCustomChip(color: Color(0xFF282828),text: "take-down",),
                    MyCustomChip(color: Color(0xFF282828),text: "mega-punch",),
                    MyCustomChip(color: Color(0xFF5EBF62),text: "thunder-punch",),
                    MyCustomChip(color: Color(0xFF282828),text: "pay-day",),
                    MyCustomChip(color: Color(0xFF5EBF62),text: "slam",),
                    MyCustomChip(color: Color(0xFF282828),text: "headbutt",),
                    MyCustomChip(color: Color(0xFF5EBF62),text: "growl",),
                    MyCustomChip(color: Color(0xFF282828),text: "take-down",),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const TextIconRow(icon:Icon(Icons.fitness_center, color: Colors.white,size: 20,),text:'Fisíco',color: Colors.blue,),
              const SizedBox(height: 5),
              Wrap(
                children:[
                  Container(height: 70, decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Altura\n\n(0,72 cm)'),Text('Peso\n\n(6.9 kg)')],),
                  ),),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}
