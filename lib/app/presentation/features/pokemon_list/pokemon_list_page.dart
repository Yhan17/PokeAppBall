import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lottie/lottie.dart';

import '../../../infra/repositories/pokemon_repository_impl.dart';
import '../../shared/theme/app_typohraphy.dart';
import '../details/details_page.dart';
import 'controller/pokemon_list_controller.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final pokemonController = PokemonListController(
    repository: Get.find<PokemonRepositoryImpl>(),
  );
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _loadItems();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('Fecth More');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokemons',
          style: AppTypography.textLarge,
        ),
      ),
      body: LazyLoadScrollView(
        onEndOfPage: () {
          print('ENd of page');
        },
        scrollOffset: 100,
        child: pokemonController.obx(
          (pokemonList) {
            return AnimatedList(
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
                          arguments: pokemonList![index],
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: .5, color: Color(0xFFC1C1C1)),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Hero(
                                tag: pokemonList![index].image,
                                child: SizedBox(
                                  width: 65,
                                  height: 55,
                                  child: SvgPicture.network(
                                    pokemonList[index].image,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pokemonList[index].name,
                                  style: AppTypography.textLarge,
                                ),
                                Text(
                                  '#00${pokemonList[index].id}',
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
            );
          },
          onError: (error) {
            return Center(
              child: Text(
                'Deu erro ó',
                style: AppTypography.textLarge,
              ),
            );
          },
          onLoading: Center(
            child: Lottie.asset(
              'assets/animations/pokeball_loading.json',
              height: 80,
              width: 80,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadItems() async {
    await pokemonController.fetchPokemons();
    late Future future = Future(() {});
    for (var i = 0; i < pokemonController.pokemonList.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          listKey.currentState!.insertItem(i);
        });
      });
    }
  }
}
