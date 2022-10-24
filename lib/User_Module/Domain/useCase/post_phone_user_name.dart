import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/User_Module/Data/network/failur/failur.dart';
import 'package:maged_soft_test/User_Module/Data/repository/user_repo.dart';
import 'package:maged_soft_test/User_Module/Data/resources/remote_data_source/dio_helper.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/otp_responce.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user_response.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';
import 'package:maged_soft_test/User_Module/Domain/reposotitiry/base_user_repo.dart';

class PostPhoneNumberAndUserName {
  /// creaye a single tone object
  PostPhoneNumberAndUserName._instance();
  static final PostPhoneNumberAndUserName _postPhoneAndUser =
      PostPhoneNumberAndUserName._instance();
  factory PostPhoneNumberAndUserName() => _postPhoneAndUser;

  // from abstract repository create a object

  final BaseVerifyUserRepo? verifyUser = VerifyUserRepo();

// ignore: slash_for_doc_comments
/**
 * the use case connect and collect data from prensenation and connect to entity and repositiry
 * the userName and userPhone will cpme from the presentation layed
 */
  Future<Either<Failur, UserResponce>> useCaseSendPhoneAndUserName(
      {User? userInfo}) async {
    print(VerifyUserRepo().hashCode);
    final result = PostPhoneNumberAndUserName()
        .verifyUser!
        .verifyUserPhone(userInfo: userInfo);
    return result;
  }
}
