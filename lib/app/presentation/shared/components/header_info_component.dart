import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeappball/app/presentation/shared/components/mycustom_chip_component.dart';
import 'package:pokeappball/app/presentation/shared/theme/app_typohraphy.dart';

class HeaderInfo extends StatefulWidget {
  const HeaderInfo({
    Key? key,
  }) : super(key: key);
  @override
  _HeaderInfoState createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children:  <Widget>[
          Expanded(
              flex: 5,
              child: Text("Pikachu",
                  style: AppTypography.textTitle),),
          const Expanded(
              child: Text("#001",
                  style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold))),
        ]),
        const SizedBox(
          height: 5,
        ),
        const Chip(
          label: Text(
            'Eletric',
            style:  TextStyle(
                color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
          ),
          backgroundColor:  Color(0xFF5EBF62),
        ),
      ],
    );
  }

}
