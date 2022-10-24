import 'package:maged_soft_test/Core/shared/constants.dart';
import 'package:maged_soft_test/Domain/entities/user_response.dart';

class UserResponceModel extends UserResponce {
  const UserResponceModel({
    super.code,
    super.messege,
    super.statusCode,
  });

  factory UserResponceModel.fromJson(Map<String?, dynamic> json) {
    return UserResponceModel(
        code: json[AppConstants.code],
        statusCode: json[AppConstants.staus],
        messege: json[AppConstants.message]);
  }
}
