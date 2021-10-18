import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/home/home_page.dart';
import '../../features/splash/splash_page.dart';

class AppRoutes {
  static String get initialRoute => '/';

  static List<GetPage> get pages => [
        GetPage(name: '/', page: () => const SplashPage()),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ];
}
