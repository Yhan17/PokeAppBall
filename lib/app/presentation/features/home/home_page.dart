import 'package:flutter/material.dart';
import 'package:pokeappball/app/presentation/shared/components/information_row_component.dart';
import 'package:pokeappball/app/presentation/shared/components/textbutton_component.dart';
import 'package:pokeappball/app/presentation/shared/components/textfield_component.dart';

import '../../shared/theme/app_typohraphy.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 57, left: 26, right: 26),
            child: Column(
              children: <Widget>[
                Text("Digite abaixo o nome do pokemon que deseja buscar",
                    style: AppTypography.textLarge),
                const SizedBox(
                  height: 17,
                ),
                const TextFieldComponent(),
                const SizedBox(
                  height: 35,
                ),
                TextButtonComponent(
                  onTap: () {
                    Navigator.pushNamed(context, '/details');
                  },
                  text: "Pokedex",
                  color: Color(0xFF5EBF62),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const <Widget>[
                    Expanded(
                      child: TextButtonComponent(
                        text: "Movimentos",
                        color: Color(0xFF70B8F9),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextButtonComponent(
                        text: "Habilidades",
                        color: Color(0xFFEB6025),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          InformationRow(),
          Positioned(
            left: -50,
            top: MediaQuery.of(context).size.height - 260,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                "assets/images/pokebola.png",
                width: MediaQuery.of(context).size.width * 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
