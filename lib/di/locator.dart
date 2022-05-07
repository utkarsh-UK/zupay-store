import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:zupay_store/data/datasources/remote_datasource.dart';
import 'package:zupay_store/data/repository_impl/user_repository_impl.dart';
import 'package:zupay_store/domain/repository/user_repository.dart';
import 'package:zupay_store/domain/usecase/user/get_all_products.dart';
import 'package:zupay_store/presentation/provider/products_provider.dart';

final locator = GetIt.instance;

void inject() {
  // external dependencies
  locator.registerLazySingleton(() => http.Client());

  // datasources
  locator.registerLazySingleton<RemoteDatasource>(
      () => RemoteDatsourceImpl(locator()));

  // repositories
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(locator()));

  // usecases
  locator.registerLazySingleton(() => GetAllProducts(locator()));

  // providers
  locator
      .registerLazySingleton(() => ProductsProvider(getAllProducts: locator()));
}
