import 'package:maged_soft_test/Core/shared/enums.dart';
import 'package:maged_soft_test/User_Module/Domain/entities/user_response.dart';

// responce of the state to the ui
class UserState {
  final String? statemessege;
  final UserResponce? stateUserRespond;
  // referef to the stae of auth request is done or refused or sucess
  final RequestState? stateResponce;

  UserState({this.statemessege, this.stateUserRespond, this.stateResponce});
}
