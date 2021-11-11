import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lottie/lottie.dart';

import '../../../infra/repositories/pokemon_repository_impl.dart';
import '../../shared/theme/app_typohraphy.dart';
import '../details/details_page.dart';
import 'controller/pokemon_list_controller.dart';

class PokemonListPage extends HookWidget {
  PokemonListPage({Key? key}) : super(key: key);

  final pokemonController = PokemonListController(
    repository: Get.find<PokemonRepositoryImpl>(),
  );
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final ScrollController scrollController = useScrollController();
    useEffect(() {
      _loadItems();
    }, const []);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokemons',
          style: AppTypography.textLarge,
        ),
      ),
      body: Obx(
        () => LazyLoadScrollView(
          onEndOfPage: () => _loadAnotherPage(),
          isLoading: pokemonController.pageLoading.value,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: pokemonController.initialLoading.value
                  ? Center(
                      child: Lottie.asset(
                        'assets/animations/pokeball_loading.json',
                        height: 80,
                        width: 80,
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AnimatedList(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          key: listKey,
                          itemBuilder: (_, index, animation) {
                            return SlideTransition(
                              position: animation.drive(
                                Tween<Offset>(
                                  begin: const Offset(1, 0),
                                  end: const Offset(0, 0),
                                ).chain(
                                  CurveTween(curve: Curves.ease),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 8,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => const DetailsPage(),
                                      arguments:
                                          pokemonController.pokemonList[index],
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: .5,
                                            color: Color(0xFFC1C1C1)),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Hero(
                                            tag: pokemonController
                                                .pokemonList[index].image,
                                            child: SizedBox(
                                              width: 65,
                                              height: 55,
                                              child: SvgPicture.network(
                                                pokemonController
                                                    .pokemonList[index].image,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              pokemonController
                                                  .pokemonList[index].name,
                                              style: AppTypography.textLarge,
                                            ),
                                            Text(
                                              '#00${pokemonController.pokemonList[index].id}',
                                              style: AppTypography.pokemonId,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        if (pokemonController.pageLoading.value)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadItems() async {
    await pokemonController.fetchPokemons();
    if (pokemonController.initialLoading.value) {
      pokemonController.initialLoading.value = false;
    }

    late Future future = Future(() {});
    for (var i = 0; i < pokemonController.pokemonList.length; i++) {
      future = future.then(
        (_) {
          return Future.delayed(
            const Duration(milliseconds: 100),
            () {
              if (listKey.currentState != null) {
                listKey.currentState!.insertItem(
                  i,
                  duration: const Duration(milliseconds: 700),
                );
              }
            },
          );
        },
      );
    }
  }

  Future<void> _loadAnotherPage() async {
    pokemonController.pageLoading.value = true;
    pokemonController.initial.value += 10;
    pokemonController.limit.value += 10;
    if (listKey.currentState != null) {
      await pokemonController.fetchPokemons(listKey: listKey);
    }
    pokemonController.pageLoading.value = false;
  }
}
