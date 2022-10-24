import 'package:dartz/dartz.dart';
import 'package:maged_soft_test/Data/network/failur/failur.dart';
import 'package:maged_soft_test/Domain/entities/help.dart';
import 'package:maged_soft_test/Domain/reposotitiry/base_user_repo.dart';

class GetHelp {
  // creaye a single tone
  GetHelp._instance();

  static final GetHelp _getHelp = GetHelp._instance();
  factory GetHelp() => _getHelp;
  BaseVerifyUserRepo? verifyUserRepo;

  Future<Either<Failur, Help>> useCaseGetHelp() async {
    final result = GetHelp().verifyUserRepo!.getHelp();
    return result;
  }
}
