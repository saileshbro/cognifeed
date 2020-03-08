import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/profile/bloc/managepassword_event.dart';
import 'package:cognifeed_app/profile/bloc/managepassword_state.dart';

import '../profile_repository.dart';

class ManagePasswordBloc
    extends Bloc<ManagePasswordEvent, ManagePasswordState> {
  @override
  ManagePasswordState get initialState => ManagePasswordUninitialisedState();

  @override
  Stream<ManagePasswordState> mapEventToState(
      ManagePasswordEvent event) async* {
    yield ManagePasswordRequestingState();
    try {
      String message;
      if (event is ChangePasswordEvent) {
        message = await ProfileRepository.changePassword(
          currentPassword: event.changePassword.currentpw,
          newPassword: event.changePassword.newpw,
        );
        yield ManagePasswordSuccessState(message: message);
      } else if (event is ForgetPasswordEvent) {
        message = await ProfileRepository.forgetPassword(
          currentPassword: event.changePassword.currentpw,
          newPassword: event.changePassword.newpw,
          verificationCode: event.changePassword.vcode,
        );
        yield ManagePasswordSuccessState(message: message);
      }
    } catch (e) {
      yield ManagePasswordErrorState(error: e.toString());
    }
  }
}
