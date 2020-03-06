import 'package:cognifeed_app/application_wrapper.dart';
import 'package:cognifeed_app/auth/authentication_bloc.dart';
import 'package:cognifeed_app/auth/authentication_events.dart';
import 'package:cognifeed_app/auth/authentication_states.dart';
import 'package:cognifeed_app/fav/fav_page.dart';
import 'package:cognifeed_app/misc/loading_indicator.dart';
import 'package:cognifeed_app/misc/splash_page.dart';
import 'package:cognifeed_app/password_reset/forgot_password_page.dart';
import 'package:cognifeed_app/profile/profile_page.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:cognifeed_app/settings/settings_page.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/authentication_page.dart';
import 'home/home_page.dart';
import 'home/home_page.dart';
import 'home/home_page.dart';
import 'home/home_page.dart';
import 'home/home_page.dart';
import 'home/home_page.dart';
import 'home/onboarding_page.dart';

import 'home/onboarding_page.dart';
import 'login/login_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

Future<void> main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  WidgetsFlutterBinding.ensureInitialized();
  Cognifeed.drawerPages = DrawerPages.Home;
  Cognifeed.pref = await SharedPreferences.getInstance();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        },
      ),
      BlocProvider<LoginBloc>(
        create: (BuildContext context) {
          return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository);
        },
      ),
    ],
    child: App(
      userRepository: userRepository,
    ),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CognifeedTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.route: (_) => HomePage(),
        ForgotPasswordPage.route: (_) => ForgotPasswordPage(),
        FavPage.route: (_) => FavPage(),
        SettingsPage.route: (_) => SettingsPage(),
        ProfilePage.route: (_) => ProfilePage(),
      },
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return OnboardingPage();
          }
          if (state is AuthenticationUnauthenticated) {
            return AuthenticationPage(
              userRepository: UserRepository(),
            );
            // return HomePage();
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}
