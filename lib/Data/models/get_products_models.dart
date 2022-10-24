import 'package:maged_soft_test/Core/shared/constants.dart';
import 'package:maged_soft_test/Domain/entities/products_responce.dart';

class ProductsResponceModel extends ProductsResponce {
  ProductsResponceModel({
    super.messege,
    super.products,
    super.statusCode,
  });

  factory ProductsResponceModel.fromJson(Map<String, dynamic> json) {
    return ProductsResponceModel(
        messege: json[AppConstants.message],
        products: json[AppConstants.products],
        statusCode: json[AppConstants.staus]);
  }
}
