import 'package:flutter/material.dart';
import '../../shared/theme/app_typohraphy.dart';

class InformationRow extends StatelessWidget {
  const InformationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17).copyWith(bottom: 50),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.info,
                  color: Colors.amber,
                ),
              ),
              Flexible(
                child: Text(
                  'Encontre informações do seu pokémon favorito na tela do seu dispositivo...',
                  style: AppTypography.textSmall,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
