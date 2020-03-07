import 'package:cognifeed_app/profile/profile_update_request_model.dart';
import 'package:meta/meta.dart';

abstract class ProfileEvent {}

class GetProfileInfoEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final UpdateProfileRequestModel model;

  UpdateProfileEvent({@required this.model});
}
