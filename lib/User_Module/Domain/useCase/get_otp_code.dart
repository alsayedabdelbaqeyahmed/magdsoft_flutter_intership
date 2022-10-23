import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/User_Module/Data/network/failur/failur.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/otp_responce.dart';

import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';
import 'package:maged_soft_test/User_Module/Domain/reposotitiry/base_user_repo.dart';

class GetOtpCodeResponce {
  // from abstract repository create a object
  final BaseVerifyUserRepo verifyUser;

  GetOtpCodeResponce(this.verifyUser);
// ignore: slash_for_doc_comments
/**
 * the use case connect and collect data from prensenation and connect to entity and repositiry
 * the userName and userPhone will cpme from the presentation layed
 */

  Future<Either<Failur, OtpResponce>> useCaseGetOtpResponce(User? otpResponce) {
    return verifyUser.getOtpResponce(otpResponce: otpResponce);
  }
}
