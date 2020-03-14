import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/profile/bloc/uploadImage_event.dart';
import 'package:cognifeed_app/profile/bloc/uploadImage_state.dart';
import 'package:cognifeed_app/profile/profile_repository.dart';

class UploadBloc extends Bloc<UploadPictureEvent, UploadPictureState> {
  @override
  UploadPictureState get initialState => UploadInitialState();

  @override
  Stream<UploadPictureState> mapEventToState(event) async* {
    yield UploadSendingState();

    try {
      if (event is UploadProfilePicture) {
        var response = await ProfileRepository.uploadProfilePicture(
            image: event.uploadImage);
        Cognifeed.loggedInUser.imageUrl = response['image_url'];
        Cognifeed.pref.setString("image_url", response['image_url']);
        yield UploadSuccessState(message: response['message']);
      }
    } catch (e) {
      yield UploadFailedState(error: e.toString());
    }
  }
}
