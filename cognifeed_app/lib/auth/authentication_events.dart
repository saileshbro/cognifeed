import 'package:meta/meta.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String about;
  final String address;
  final String bio;
  final String email;
  final String imageUrl;
  final String name;
  final String phone;
  final String token;
  final String website;
  final String joinedDate;

  const LoggedIn({
    @required this.about,
    @required this.address,
    @required this.bio,
    @required this.phone,
    @required this.website,
    @required this.joinedDate,
    @required this.token,
    @required this.email,
    @required this.name,
    @required this.imageUrl,
  });

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {}
