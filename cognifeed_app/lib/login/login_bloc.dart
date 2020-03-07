import 'dart:async';

import 'package:cognifeed_app/auth/authentication_bloc.dart';
import 'package:cognifeed_app/auth/authentication_events.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/login/login_events.dart';
import 'package:cognifeed_app/login/login_states.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final loginResponse = await userRepository.authenticate(
          email: event.email,
          password: event.password,
        );
        print(loginResponse.toJson().toString());
        authenticationBloc.add(
          LoggedIn(
            token: loginResponse.token,
            email: loginResponse.email,
            name: loginResponse.name,
            imageUrl: loginResponse.imageUrl,
            about: loginResponse.about,
            address: loginResponse.address,
            bio: loginResponse.bio,
            joinedDate: loginResponse.joinedDate,
            phone: loginResponse.phone,
            website: loginResponse.website,
          ),
        );

        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
    if (event is SignupButtonPressed) {
      yield LoginLoading();
      try {
        final response = await userRepository.signup(
          email: event.email,
          password: event.password,
          phone: event.phone,
          name: event.name,
        );

        authenticationBloc.add(LoggedIn(
          token: response.token,
          email: response.email,
          name: response.name,
          imageUrl: response.imageUrl,
          about: response.about,
          address: response.address,
          bio: response.bio,
          joinedDate: response.joinedDate,
          phone: response.phone,
          website: response.website,
        ));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
