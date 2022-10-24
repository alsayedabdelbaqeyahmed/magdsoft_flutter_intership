import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/Data/network/failur/failur.dart';
import 'package:maged_soft_test/Domain/entities/otp_responce.dart';

import 'package:maged_soft_test/Domain/entities/user.dart';
import 'package:maged_soft_test/Domain/reposotitiry/base_user_repo.dart';

class GetOtpCodeResponce {
  BaseVerifyUserRepo? verifyUser;

  /// create a single tone object
  GetOtpCodeResponce._instance();
  static final GetOtpCodeResponce _getOtpCode =
      GetOtpCodeResponce._instance(); // simgle instance
  factory GetOtpCodeResponce() =>
      _getOtpCode; // factory create a single instance

  ///
  /// the use case connect and collect data from prensenation and connect to entity and repositiry
  /// the userName and userPhone will cpme from the presentation layed

  Future<Either<Failur, OtpResponce>> useCaseGetOtpResponce(
      {User? otpResponce}) {
    final result = GetOtpCodeResponce()
        .verifyUser!
        .getOtpResponce(otpResponce: otpResponce);
    return result;
  }
}
