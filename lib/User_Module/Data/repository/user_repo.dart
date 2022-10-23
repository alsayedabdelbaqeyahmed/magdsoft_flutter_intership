// ignore_for_file: avoid_print

import 'package:maged_soft_test/User_Module/Data/resources/remote_data_source/dio_helper.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/help.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/otp_responce.dart';

import 'package:maged_soft_test/User_Module/Domain/entities/user_response.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';
import 'package:maged_soft_test/User_Module/Domain/reposotitiry/base_user_repo.dart';

class VerifyUserRepo implements BaseVerifyUserRepo {
  final BaseRemoteDataSource baseSendVerifyRequest;

  VerifyUserRepo(this.baseSendVerifyRequest);

  @override
  Future<UserResponce> verifyUserPhone({User? userInfo}) async {
    print(userInfo!.userName);
    return await baseSendVerifyRequest.remoteDataSendPhoneAndUserName(
        phone: userInfo.phoneNumber, name: userInfo.userName);
  }

  @override
  Future<OtpResponce> getOtpResponce({User? otpResponce}) async {
    return await baseSendVerifyRequest.remoteDataGetOtpResponce(
        phone: otpResponce!.phoneNumber, code: otpResponce.code);
  }

  @override
  Future<Help> getHelp() async {
    return await baseSendVerifyRequest.remoteDataGetHelp();
  }
}
