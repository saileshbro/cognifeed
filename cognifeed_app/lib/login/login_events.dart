import 'package:meta/meta.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    @required this.username,
    @required this.password,
  });

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}
