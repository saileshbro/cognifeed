import 'package:cognifeed_app/profile/bloc/profile_event.dart';
import 'package:cognifeed_app/profile/bloc/profile_state.dart';
import 'package:cognifeed_app/profile/profile_repository.dart';
import 'package:cognifeed_app/profile/profile_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  get initialState => ProfileInitialState();

  @override
  Stream<ProfileState> mapEventToState(event) async* {
    yield ProfileFetchingState();
    try {
      if (event is GetProfileInfoEvent) {
        final ProfileResponseModel responseModel =
            await ProfileRepository.getUserProfile();
        yield ProfileFetchedState(profileResponseModel: responseModel);
      }
    } catch (e) {
      yield ProfileErrorState(e.toString());
    }
  }
}
