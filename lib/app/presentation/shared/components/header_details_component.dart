import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeappball/app/presentation/shared/components/chip_component.dart';
import 'package:pokeappball/app/presentation/shared/theme/app_typohraphy.dart';

class HeaderComponent extends StatefulWidget {
  const HeaderComponent({
    Key? key,
  }) : super(key: key);
  @override
  _HeaderComponentState createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
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
        const ChipComponent(text: "Eletric", color: Color(0xFF5EBF62))
      ],
    );
  }
}
