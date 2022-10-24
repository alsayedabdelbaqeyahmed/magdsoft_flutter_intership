// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/Data/network/exception/user_exception.dart';
import 'package:maged_soft_test/Data/network/failur/failur.dart';
import 'package:maged_soft_test/Data/network/user_network/login_network.dart';
import 'package:maged_soft_test/Data/resources/remote_data_source/dio_helper.dart';
import 'package:maged_soft_test/Domain/entities/help.dart';
import 'package:maged_soft_test/Domain/entities/otp_responce.dart';

import 'package:maged_soft_test/Domain/entities/user_response.dart';
import 'package:maged_soft_test/Domain/entities/user.dart';
import 'package:maged_soft_test/Domain/reposotitiry/base_user_repo.dart';

// implement class of base repository contract
class VerifyUserRepo implements BaseVerifyUserRepo {
// create a single tone object

  VerifyUserRepo._instance();
  static final VerifyUserRepo _verifyUserRepo = VerifyUserRepo._instance();

  factory VerifyUserRepo() => _verifyUserRepo;

  // call data source
  final BaseRemoteDataSource baseSendVerifyRequest = RemoteDataDioHelper();

  // with Either right mean sucess and left mean failue
  @override
  Future<Either<Failur, UserResponce>> verifyUserPhone({User? userInfo}) async {
    final result = await baseSendVerifyRequest.remoteDataSendPhoneAndUserName(
        phone: userInfo!.phoneNumber, name: userInfo.userName);
    // right mean sucess (UserResponce data)
    try {
      print(result);
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
      print(result);
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
      print(result);
      return Right(result);
    } on UserServerException catch (error) {
      return Left(
        ServerFailur(errorMessege: error.loginErrorMessegeNetwork!.messege),
      );
    }
  }
}
