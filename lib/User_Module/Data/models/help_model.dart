import 'package:maged_soft_test/Core/shared/constants.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/help.dart';

class HelpModel extends Help {
  HelpModel({super.message, super.status, super.help});
  factory HelpModel.fromJson(Map<String, dynamic> json) {
    return HelpModel(
        message: json[AppConstants.message],
        status: json[AppConstants.staus],
        help: json[AppConstants.help]);
  }
}
