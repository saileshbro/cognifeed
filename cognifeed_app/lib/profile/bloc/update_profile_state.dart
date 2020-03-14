import 'package:meta/meta.dart';

abstract class UpdateProfileState {}

class ProfileUpdateInitialState extends UpdateProfileState {}

class ProfileUpdateFetchingState extends UpdateProfileState {}

class ProfileUpdateSuccessMessageState extends UpdateProfileState {
  final String message;

  ProfileUpdateSuccessMessageState({@required this.message});
}

class ProfileUpdateErrorState extends UpdateProfileState {
  final String error;

  ProfileUpdateErrorState(this.error);
}
