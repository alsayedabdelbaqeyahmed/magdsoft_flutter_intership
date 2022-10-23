import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/User_Module/Data/network/failur/failur.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/otp_responce.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user_response.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';
import 'package:maged_soft_test/User_Module/Domain/reposotitiry/base_user_repo.dart';

class PostPhoneNumberAndUserName {
  // from abstract repository create a object
  final BaseVerifyUserRepo verifyUser;

  PostPhoneNumberAndUserName(this.verifyUser);
// ignore: slash_for_doc_comments
/**
 * the use case connect and collect data from prensenation and connect to entity and repositiry
 * the userName and userPhone will cpme from the presentation layed
 */
  Future<Either<Failur, UserResponce>> useCaseSendPhoneAndUserName(
      {User? userInfo}) async {
    return await verifyUser.verifyUserPhone(userInfo: userInfo);
  }
}
