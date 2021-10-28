import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../shared/theme/app_theme.dart';
import 'bindings/app_bindings.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PokeAppBall',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.initialRoute,
      initialBinding: AppBindings(),
      theme: AppTheme.defaultTheme,
    );
  }
}
