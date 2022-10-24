import 'package:maged_soft_test/Data/network/user_network/login_network.dart';

class UserServerException implements Exception {
  final LoginErrorMessegeNetwork? loginErrorMessegeNetwork;

  const UserServerException({
    this.loginErrorMessegeNetwork,
  });
}
