import 'package:maged_soft_test/User_Module/Domain/entities/help.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/otp_responce.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user_response.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';

// contract class that will be implemented
abstract class BaseVerifyUserRepo {
  Future<UserResponce> verifyUserPhone({User? userInfo});
  Future<OtpResponce> getOtpResponce({User? otpResponce});
  Future<Help> getHelp();
}
