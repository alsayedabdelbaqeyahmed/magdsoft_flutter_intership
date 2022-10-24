import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/Data/network/failur/failur.dart';
import 'package:maged_soft_test/Domain/entities/help.dart';
import 'package:maged_soft_test/Domain/entities/otp_responce.dart';
import 'package:maged_soft_test/Domain/entities/user_response.dart';
import 'package:maged_soft_test/Domain/entities/user.dart';

// contract class that will be implemented
abstract class BaseVerifyUserRepo {
  Future<Either<Failur, UserResponce>> verifyUserPhone({User? userInfo});
  Future<Either<Failur, OtpResponce>> getOtpResponce({User? otpResponce});
  Future<Either<Failur, Help>> getHelp();
}
