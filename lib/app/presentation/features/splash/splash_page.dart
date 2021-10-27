import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../shared/theme/app_typohraphy.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => Get.toNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset('assets/animations/splash_pokemon.json'),
          const SizedBox(
            height: 44,
          ),
          Text(
            'Loading...',
            style: AppTypography.textLarge,
          )
        ],
      ),
    );
  }
}
