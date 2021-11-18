import 'package:get/get.dart';
import '../../details/details_page.dart';

import '../../../../domain/repositories/pokemon_repository.dart';

class HomeController extends GetxController {
  final PokemonRepository repository;
  final isLoading = false.obs;

  HomeController(this.repository);

  Future<void> getPokemonByName(String name) async {
    try {
      isLoading.value = true;
      final result = await repository.getPokemon(name);
      result.fold(
        (l) {
          Get.defaultDialog(title: 'Erro no Servidor');
        },
        (pokemon) {
          isLoading.value = false;
          Get.to(
            () => const DetailsPage(),
            arguments: pokemon,
          );
        },
      );
    } catch (_) {
      isLoading.value = false;
    }
  }
}
