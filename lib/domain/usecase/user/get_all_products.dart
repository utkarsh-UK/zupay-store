import 'package:dartz/dartz.dart';
import 'package:zupay_store/core/usecases/usecase.dart';
import 'package:zupay_store/core/utils/failure.dart';
import 'package:zupay_store/domain/repository/user_repository.dart';

import '../../entities/product.dart';

class GetAllProducts extends UseCase<List<Product>, NoParams> {
  final UserRepository _repository;

  GetAllProducts(this._repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) {
    return _repository.getAllProducts();
  }
}
