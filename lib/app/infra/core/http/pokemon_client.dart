import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';

class PokemonClient extends DioMixin {
  @override
  HttpClientAdapter get httpClientAdapter => BrowserHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        headers: {
          'Accept': 'application/json',
        },
      );
}
