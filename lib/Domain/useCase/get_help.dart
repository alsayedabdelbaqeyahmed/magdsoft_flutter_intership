import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/Data/network/failur/failur.dart';
import 'package:maged_soft_test/Data/repository/user_repo.dart';
import 'package:maged_soft_test/Domain/entities/help.dart';
import 'package:maged_soft_test/Domain/reposotitiry/base_user_repo.dart';

class GetHelp {
  // creaye a single tone
  GetHelp._instance();

  static final GetHelp _getHelp = GetHelp._instance();
  factory GetHelp() => _getHelp;
  final BaseVerifyUserRepo? verifyUser = VerifyUserRepo();

  Future<Either<Failur, Help>> useCaseGetHelp() async {
    final result = GetHelp().verifyUser!.getHelp();
    return result;
  }
}
