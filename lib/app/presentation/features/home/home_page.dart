import 'package:flutter/material.dart';

import '../../shared/theme/app_typohraphy.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Coloca o conteudo aqui porra',style: AppTypography.textLarge,),
    );
  }
}