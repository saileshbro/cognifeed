import 'package:cognifeed_app/profile/profile_response_model.dart';
import 'package:meta/meta.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileFetchingState extends ProfileState {}

class ProfileSuccessMessageState extends ProfileState {
  final String message;

  ProfileSuccessMessageState({@required this.message});
}

class ProfileFetchedState extends ProfileState {
  final ProfileResponseModel profileResponseModel;
  ProfileFetchedState({@required this.profileResponseModel});
}

class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState(this.error);
}
