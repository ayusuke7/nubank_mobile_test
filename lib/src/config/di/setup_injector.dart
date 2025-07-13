import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/alias_repository.dart';
import '../../data/services/api/url_shortener_api.dart';
import '../../ui/home/controllers/home_controller.dart';
import '../http/client/client.dart';
import '../http/dio/dio_client_impl.dart';

final it = GetIt.instance;

void setupInjector() {
  it.registerFactory<Dio>(DioFactory.dio);
  it.registerFactory<Client>(
    () => DioClientImpl(dio: it()),
  );

  it.registerFactory<UrlShortenerApi>(
    () => UrlShortenerApi(client: it()),
  );
  it.registerFactory<AliasRepository>(
    () => AliasRepository(
      urlShorApi: it(),
    ),
  );

  it.registerLazySingleton<HomeController>(
    () => HomeController(aliasRepository: it()),
  );
}
