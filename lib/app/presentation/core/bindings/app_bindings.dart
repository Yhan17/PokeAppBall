import 'package:get/instance_manager.dart';

import '../../../infra/core/http/pokemon_client.dart';
import '../../../infra/repositories/pokemon_repository_impl.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PokemonClient());
    Get.put(PokemonRepositoryImpl(Get.find<PokemonClient>()));
  }
}
