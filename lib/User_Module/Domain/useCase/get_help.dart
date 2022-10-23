import 'package:maged_soft_test/User_Module/Domain/entities/help.dart';
import 'package:maged_soft_test/User_Module/Domain/reposotitiry/base_user_repo.dart';

class GetHelp {
  final BaseVerifyUserRepo verifyUserRepo;

  GetHelp(this.verifyUserRepo);
  Future<Help> useCaseGetHelp() async {
    return await verifyUserRepo.getHelp();
  }
}
