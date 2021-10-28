import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class PokemonClient extends DioMixin {
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        headers: {
          'Accept': 'application/json',
        },
      );
}
