import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/components/information_row_component.dart';
import '../../shared/components/textbutton_component.dart';
import '../../shared/components/textfield_component.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Digite abaixo o nome do pokemon que deseja buscar",
                    style: AppTypography.textLarge),
                const SizedBox(
                  height: 17,
                ),
                const TextFieldComponent(),
                const SizedBox(height: 11),
                SizedBox(
                  width: 101,
                  height: 36,
                  child: TextButton(
                    child: const Text(
                      'Buscar',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xFFEB6025),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                TextButtonComponent(
                  onTap: () {
                    Get.toNamed('/list');
                  },
                  text: "Pokedex",
                  color: const Color(0xFF5EBF62),
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
                      width: 9,
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
          const InformationRow(),
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
