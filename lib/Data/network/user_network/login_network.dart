import 'package:maged_soft_test/Core/shared/constants.dart';

import 'package:maged_soft_test/Domain/entities/user_response.dart';

class LoginErrorMessegeNetwork extends UserResponce {
  LoginErrorMessegeNetwork({super.messege, super.statusCode});

  factory LoginErrorMessegeNetwork.fromJson(Map<String, dynamic> error) {
    return LoginErrorMessegeNetwork(
      statusCode: error[AppConstants.staus],
      messege: error[AppConstants.message],
    );
  }
}

class LoginErrorLaocalDbMessegeNetwork extends UserResponce {
  LoginErrorLaocalDbMessegeNetwork({super.messege, super.statusCode});
  factory LoginErrorLaocalDbMessegeNetwork.fromJson(
      Map<String, dynamic> error) {
    return LoginErrorLaocalDbMessegeNetwork(
      statusCode: error[AppConstants.staus],
      messege: error[AppConstants.message],
    );
  }
}
