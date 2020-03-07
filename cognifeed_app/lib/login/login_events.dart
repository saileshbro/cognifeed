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
  final String name;
  final String phone;

  const SignupButtonPressed({
    @required this.name,
    @required this.phone,
    @required this.email,
    @required this.password,
  });

  @override
  String toString() =>
      'SignupButtonPressed { username: $email, password: $password }';
}
