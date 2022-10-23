import 'package:maged_soft_test/Core/shared/constants.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/otp_responce.dart';

class OtpResponceModel extends OtpResponce {
  OtpResponceModel({super.messege, super.status, super.account});

  factory OtpResponceModel.fromJson(Map<String, dynamic> json) {
    return OtpResponceModel(
        messege: json[AppConstants.message],
        status: json[AppConstants.staus],
        account: json[AppConstants.account]);
  }
}
