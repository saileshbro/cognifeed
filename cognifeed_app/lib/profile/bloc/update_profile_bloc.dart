import 'package:cognifeed_app/profile/bloc/update_profile_event.dart';
import 'package:cognifeed_app/profile/bloc/update_profile_state.dart';
import 'package:cognifeed_app/profile/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  @override
  get initialState => ProfileUpdateInitialState();

  @override
  Stream<UpdateProfileState> mapEventToState(event) async* {
    yield ProfileUpdateFetchingState();
    try {
      if (event is UpdateProfileClickedEvent) {
        final String message = await ProfileRepository.updateUserProfile(
            name: event.model.name,
            email: event.model.email,
            phone: event.model.phone,
            bio: event.model.bio,
            website: event.model.website,
            address: event.model.address,
            about: event.model.about);
        yield ProfileUpdateSuccessMessageState(message: message);
      }
    } catch (e) {
      yield ProfileUpdateErrorState(e.toString());
    }
  }
}
