import 'package:cognifeed_app/password_reset/passwordmodel.dart';
import 'package:meta/meta.dart';

abstract class ManagePasswordEvent {}

class ChangePasswordEvent extends ManagePasswordEvent {
  final ChangePassword changePassword;
  ChangePasswordEvent({@required this.changePassword})
      : assert(changePassword != null);
}

class ForgetPasswordEvent extends ManagePasswordEvent {
  final ChangePassword changePassword;
  ForgetPasswordEvent({@required this.changePassword})
      : assert(changePassword != null);
}
