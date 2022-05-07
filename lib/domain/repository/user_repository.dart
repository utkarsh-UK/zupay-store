import 'package:dartz/dartz.dart';
import 'package:zupay_store/core/utils/failure.dart';
import 'package:zupay_store/domain/entities/cart.dart';
import 'package:zupay_store/domain/entities/product.dart';

abstract class UserRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, List<Cart>>> getCart(int userId);
}
