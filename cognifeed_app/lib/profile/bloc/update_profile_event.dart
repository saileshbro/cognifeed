import 'package:cognifeed_app/profile/profile_update_request_model.dart';
import 'package:meta/meta.dart';

abstract class UpdateProfileEvent {}

class UpdateProfileClickedEvent extends UpdateProfileEvent {
  final UpdateProfileRequestModel model;

  UpdateProfileClickedEvent({@required this.model});
}
