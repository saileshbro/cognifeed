import 'package:meta/meta.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;
  final String name;
  final String email;
  final String imageUrl;
  const LoggedIn({
    @required this.token,
    @required this.email,
    @required this.name,
    @required this.imageUrl,
  });

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {}
