import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/Data/network/failur/failur.dart';
import 'package:maged_soft_test/Data/repository/product_repository.dart';
import 'package:maged_soft_test/Domain/entities/products_responce.dart';

import 'package:maged_soft_test/Domain/entities/user_response.dart';

abstract class BaseProductRepo {
  Future<Either<Failur, ProductsResponce>> getProducts();
}
