import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/Data/network/failur/failur.dart';
import 'package:maged_soft_test/Data/repository/product_repository.dart';

import 'package:maged_soft_test/Domain/entities/products_responce.dart';
import 'package:maged_soft_test/Domain/reposotitiry/base_prouct_repo.dart';

class UseCaseGetProduct {
  // creaye a single tone
  UseCaseGetProduct._instance();

  static final UseCaseGetProduct _getHelp = UseCaseGetProduct._instance();
  factory UseCaseGetProduct() => _getHelp;
  final BaseProductRepo? productRepo = ProductReposutory();

  Future<Either<Failur, ProductsResponce>> useCaseGetProducts() async {
    final result = UseCaseGetProduct().productRepo!.getProducts();
    return result;
  }
}
