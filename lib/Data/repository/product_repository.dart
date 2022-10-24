import 'package:maged_soft_test/Data/network/exception/user_exception.dart';
import 'package:maged_soft_test/Domain/entities/products_responce.dart';
import 'package:maged_soft_test/Domain/entities/user_response.dart';
import 'package:maged_soft_test/Data/network/failur/failur.dart';
import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/Domain/reposotitiry/base_prouct_repo.dart';

import '../resources/remote_data_source/dio_helper.dart';

class ProductReposutory extends BaseProductRepo {
  // create a single tone object

  ProductReposutory._instance();
  static final ProductReposutory _verifyUserRepo =
      ProductReposutory._instance();

  factory ProductReposutory() => _verifyUserRepo;

  // call data source
  final BaseRemoteDataSource baseSendVerifyRequest = RemoteDataDioHelper();

  // with Either right mean sucess and left mean failue
  @override
  Future<Either<Failur, ProductsResponce>> getProducts() async {
    final result = await baseSendVerifyRequest.remoteDataGetProduct();
    try {
      print(result);
      return Right(result);
    } on UserServerException catch (error) {
      return Left(
        ServerFailur(errorMessege: error.loginErrorMessegeNetwork!.messege),
      );
    }
  }
}
