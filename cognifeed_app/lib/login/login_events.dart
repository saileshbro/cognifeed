import 'package:meta/meta.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({
    @required this.email,
    @required this.password,
  });

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password }';
}

class SignupButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const SignupButtonPressed({
    @required this.email,
    @required this.password,
  });

  @override
  String toString() =>
      'SignupButtonPressed { username: $email, password: $password }';
}
