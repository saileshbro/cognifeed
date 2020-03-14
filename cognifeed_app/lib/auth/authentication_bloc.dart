import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/auth/authentication_events.dart';
import 'package:cognifeed_app/auth/authentication_states.dart';
import 'package:cognifeed_app/auth/user_model.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = userRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      Cognifeed.drawerPages = DrawerPages.Home;
      userRepository.persistUser(
        token: event.token,
        email: event.email,
        name: event.name,
        imageUrl: event.imageUrl,
        about: event.about,
        address: event.address,
        bio: event.bio,
        joinedDate: event.joinedDate,
        phone: event.phone,
        website: event.website,
      );
      Cognifeed.loggedInUser = UserModel(
        token: event.token,
        email: event.email,
        name: event.name,
        imageUrl: event.imageUrl,
        about: event.about,
        address: event.address,
        bio: event.bio,
        joinedDate: event.joinedDate,
        phone: event.phone,
        website: event.website,
      );
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();

      await Future.delayed(Duration(milliseconds: 1000));
      userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
