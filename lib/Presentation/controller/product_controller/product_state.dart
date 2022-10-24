// responce of the state to the ui
import 'package:maged_soft_test/Core/shared/enums.dart';
import 'package:maged_soft_test/Data/repository/product_repository.dart';
import 'package:maged_soft_test/Domain/entities/products_responce.dart';

class GetProductsState {
  final String? statemessege;
  final ProductsResponce? stateUserRespond;
  // referef to the stae of auth request is done or refused or sucess
  final RequestState? stateResponce;

  GetProductsState(
      {this.statemessege, this.stateUserRespond, this.stateResponce});
}
