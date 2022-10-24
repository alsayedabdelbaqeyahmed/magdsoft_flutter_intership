import 'package:dio/dio.dart';
import 'package:maged_soft_test/Core/shared/constants.dart';
import 'package:maged_soft_test/User_Module/Data/models/help_model.dart';
import 'package:maged_soft_test/User_Module/Data/models/otp_responce_model.dart';

import 'package:maged_soft_test/User_Module/Data/models/responce_modle.dart';
import 'package:maged_soft_test/User_Module/Data/network/exception/general_exception.dart';
import 'package:maged_soft_test/User_Module/Data/network/exception/user_exception.dart';
import 'package:maged_soft_test/User_Module/Data/network/failur/failur.dart';

import 'package:maged_soft_test/User_Module/Data/network/user_network/login_network.dart';

// contract class
abstract class BaseRemoteDataSource {
  Future<UserResponceModel> remoteDataSendPhoneAndUserName(
      {String? phone, String? name});
  Future<OtpResponceModel> remoteDataGetOtpResponce(
      {String? phone, String? code});
  Future<HelpModel> remoteDataGetHelp();
}

// implement class
class RemoteDataDioHelper implements BaseRemoteDataSource {
// create a single tone object
  RemoteDataDioHelper._instance();
  static final RemoteDataDioHelper _remoteDataSource =
      RemoteDataDioHelper._instance();
  factory RemoteDataDioHelper() => _remoteDataSource;

  // inititalize Dio package with base url
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

// semd Auth request with phone and userName
  @override
  Future<UserResponceModel> remoteDataSendPhoneAndUserName(
      {String? phone, String? name}) async {
    final UserResponceModel? responceData;
    try {
      dio!.options.headers = {
        'Content-Type': 'application/json',
      };

      final responce = await dio!.post(
        AppConstants.pathVerify,
        data: {
          AppConstants.userName: name,
          AppConstants.userphone: phone,
        },
      );
      if (responce.statusCode == 200) {
        responceData = UserResponceModel.fromJson(responce.data);

        return responceData;
      } else {
        throw UserServerException(
          loginErrorMessegeNetwork:
              LoginErrorMessegeNetwork.fromJson(responce.data),
        );
      }

      // print('my name is $name');

    } on UserServerException catch (e) {
      throw ServerFailur(errorMessege: e.loginErrorMessegeNetwork!.messege);
    }
  }

// Send Otp Request with phone and code
  @override
  Future<OtpResponceModel> remoteDataGetOtpResponce(
      {String? phone, String? code}) async {
    final OtpResponceModel? responceData;
    try {
      dio!.options.headers = {
        'Content-Type': 'application/json',
      };

      final responce = await dio!.post(
        AppConstants.pathOtp,
        queryParameters: {
          AppConstants.code: code,
          AppConstants.userphone: phone,
        },
      );
      if (responce.statusCode == 200) {
        responceData = OtpResponceModel.fromJson(responce.data);

        return responceData;
      } else {
        throw UserServerException(
          loginErrorMessegeNetwork:
              LoginErrorMessegeNetwork.fromJson(responce.data),
        );
      }
    } on UserServerException catch (e) {
      throw ServerFailur(errorMessege: e.loginErrorMessegeNetwork!.messege);
    }
  }

// get help request the data returned will be showen at Help pages
  @override
  Future<HelpModel> remoteDataGetHelp() async {
    final HelpModel responceData;
    try {
      dio!.options.headers = {
        'Content-Type': 'application/json',
      };

      final responce = await dio!.get(
        AppConstants.getHelp,
      );
      if (responce.statusCode == 200) {
        responceData = HelpModel.fromJson(responce.data);

        return responceData;
      } else {
        throw UserServerException(
          loginErrorMessegeNetwork:
              LoginErrorMessegeNetwork.fromJson(responce.data),
        );
      }
    } on UserServerException catch (e) {
      throw ServerFailur(errorMessege: e.loginErrorMessegeNetwork!.messege);
    }
  }
}
