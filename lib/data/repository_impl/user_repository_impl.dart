import 'package:zupay_store/core/utils/exceptions.dart';
import 'package:zupay_store/data/datasources/remote_datasource.dart';
import 'package:zupay_store/domain/entities/product.dart';
import 'package:zupay_store/domain/entities/cart.dart';
import 'package:zupay_store/core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:zupay_store/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDatasource _remoteDatasource;

  UserRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      return Right(await _remoteDatasource.getAllProducts());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getCart(int userId) {
    // TODO: implement getCart
    throw UnimplementedError();
  }
}
