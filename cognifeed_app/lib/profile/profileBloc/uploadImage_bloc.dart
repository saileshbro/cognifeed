import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/profile/profileBloc/uploadImage_event.dart';
import 'package:cognifeed_app/profile/profileBloc/uploadImage_state.dart';

class UploadBloc extends Bloc<UploadPictureEvent, UploadPictureState> {
  @override
  UploadPictureState get initialState => UploadInitialState();

  @override
  Stream<UploadPictureState> mapEventToState(event) async* {
    yield UploadSendingState();
    String message;
    try {
      if (event is UploadProfilePicture) {
        message = await Future.error("API CHANGE ERROR.");
        // message = await profileRepository.uploadProfilePicture(
        //     image: event.uploadImage);
        yield UploadSuccessState(message: message);
      }
    } catch (e) {
      yield UploadFailedState(error: e.toString());
    }
  }
}
