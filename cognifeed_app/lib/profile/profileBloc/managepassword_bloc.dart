import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/profile/profileBloc/managepassword_event.dart';
import 'package:cognifeed_app/profile/profileBloc/managepassword_state.dart';

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
        yield ManagePasswordSuccessState(message: message);
      } else if (event is ForgetPasswordEvent) {
        yield ManagePasswordSuccessState(message: message);
      }
    } catch (e) {
      yield ManagePasswordErrorState(error: e.toString());
    }
  }
}
