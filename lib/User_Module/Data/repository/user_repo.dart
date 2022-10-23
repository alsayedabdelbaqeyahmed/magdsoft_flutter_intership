// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/User_Module/Data/network/exception/user_exception.dart';
import 'package:maged_soft_test/User_Module/Data/network/failur/failur.dart';
import 'package:maged_soft_test/User_Module/Data/network/user_network/login_network.dart';
import 'package:maged_soft_test/User_Module/Data/resources/remote_data_source/dio_helper.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/help.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/otp_responce.dart';

import 'package:maged_soft_test/User_Module/Domain/entities/user_response.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user.dart';
import 'package:maged_soft_test/User_Module/Domain/reposotitiry/base_user_repo.dart';

// implement class of base repository contract
class VerifyUserRepo implements BaseVerifyUserRepo {
  // call data source
  final BaseRemoteDataSource baseSendVerifyRequest;

  VerifyUserRepo(this.baseSendVerifyRequest);
  // with Either right mean sucess and left mean failue
  @override
  Future<Either<Failur, UserResponce>> verifyUserPhone({User? userInfo}) async {
    final result = await baseSendVerifyRequest.remoteDataSendPhoneAndUserName(
        phone: userInfo!.phoneNumber, name: userInfo.userName);
    // right mean sucess (UserResponce data)
    try {
      return Right(result);
    } on UserServerException catch (error) {
      // with failure send the error messege to ServerFailure class
      return Left(
        ServerFailur(errorMessege: error.loginErrorMessegeNetwork!.messege),
      );
    }
  }

  @override
  Future<Either<Failur, OtpResponce>> getOtpResponce(
      {User? otpResponce}) async {
    final result = await baseSendVerifyRequest.remoteDataGetOtpResponce(
        phone: otpResponce!.phoneNumber, code: otpResponce.code);
    try {
      return Right(result);
    } on UserServerException catch (error) {
      return Left(
        ServerFailur(errorMessege: error.loginErrorMessegeNetwork!.messege),
      );
    }
  }

  @override
  Future<Either<Failur, Help>> getHelp() async {
    final result = await baseSendVerifyRequest.remoteDataGetHelp();
    try {
      return Right(result);
    } on UserServerException catch (error) {
      return Left(
        ServerFailur(errorMessege: error.loginErrorMessegeNetwork!.messege),
      );
    }
  }
}
