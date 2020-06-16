import 'dart:io';

import 'package:cognifeed_app/all_articles/all_articles_page.dart';
import 'package:cognifeed_app/articles/all_articles_bloc.dart';
import 'package:cognifeed_app/articles/articles_bloc.dart';
import 'package:cognifeed_app/articles/fav_bloc.dart';
import 'package:cognifeed_app/articles/hide_bloc.dart';
import 'package:cognifeed_app/auth/authentication_bloc.dart';
import 'package:cognifeed_app/auth/authentication_events.dart';
import 'package:cognifeed_app/auth/authentication_page.dart';
import 'package:cognifeed_app/auth/authentication_states.dart';
import 'package:cognifeed_app/auth/user_model.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/fav/fav_page.dart';
import 'package:cognifeed_app/hidden/hidden_page.dart';
import 'package:cognifeed_app/home/home_page.dart';
import 'package:cognifeed_app/login/login_bloc.dart';
import 'package:cognifeed_app/misc/loading_indicator.dart';
import 'package:cognifeed_app/misc/splash_page.dart';
import 'package:cognifeed_app/onboarding/onboarding_page.dart';
import 'package:cognifeed_app/profile/bloc/managepassword_bloc.dart';
import 'package:cognifeed_app/profile/bloc/profile_bloc.dart';
import 'package:cognifeed_app/profile/bloc/update_profile_bloc.dart';
import 'package:cognifeed_app/profile/bloc/uploadImage_bloc.dart';
import 'package:cognifeed_app/profile/profile_page.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:cognifeed_app/settings/settings_page.dart';
import 'package:cognifeed_app/tags/tags_bloc.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final userRepository = UserRepository();
  WidgetsFlutterBinding.ensureInitialized();
  Cognifeed.drawerPages = DrawerPages.Home;
  Cognifeed.dioClient.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    options.headers = {
      HttpHeaders.authorizationHeader: "Bearer ${Cognifeed.loggedInUser.token}",
      HttpHeaders.contentTypeHeader: "application/json"
    };
  }));
  Cognifeed.pref = await SharedPreferences.getInstance();
  await Cognifeed.pushNotificationService.initialise();
  Cognifeed.loggedInUser = UserModel(
    email: Cognifeed.pref.getString('email'),
    token: Cognifeed.pref.getString('token'),
    name: Cognifeed.pref.getString('name'),
    imageUrl: Cognifeed.pref.getString('image_url'),
    bio: Cognifeed.pref.getString('bio'),
    phone: Cognifeed.pref.getString('phone'),
    address: Cognifeed.pref.getString('address'),
    website: Cognifeed.pref.getString('website'),
    about: Cognifeed.pref.getString('about'),
    joinedDate: Cognifeed.pref.getString('joinedDate'),
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        },
      ),
      BlocProvider<ProfileBloc>(
        create: (BuildContext context) {
          return ProfileBloc();
        },
      ),
      BlocProvider<ManagePasswordBloc>(
        create: (BuildContext context) {
          return ManagePasswordBloc();
        },
      ),
      BlocProvider<UpdateProfileBloc>(
        create: (BuildContext context) {
          return UpdateProfileBloc();
        },
      ),
      BlocProvider<ThemeBloc>(
        create: (BuildContext context) {
          return ThemeBloc();
        },
      ),
      BlocProvider<FavArticlesBloc>(
        create: (BuildContext context) {
          return FavArticlesBloc();
        },
      ),
      BlocProvider<HideArticlesBloc>(
        create: (BuildContext context) {
          return HideArticlesBloc();
        },
      ),
      BlocProvider<AllArticlesBloc>(
        create: (BuildContext context) {
          return AllArticlesBloc();
        },
      ),
      BlocProvider<ArticlesBloc>(
        create: (BuildContext context) {
          return ArticlesBloc();
        },
      ),
      BlocProvider<UploadBloc>(
        create: (BuildContext context) {
          return UploadBloc();
        },
      ),
      BlocProvider<TagBloc>(
        create: (BuildContext context) {
          return TagBloc();
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
    return BlocBuilder<ThemeBloc, bool>(
        bloc: BlocProvider.of<ThemeBloc>(context),
        builder: (context, snapshot) {
          return MaterialApp(
            theme: CognifeedTheme.getTheme(
                BlocProvider.of<ThemeBloc>(context).isDarkTheme),
            debugShowCheckedModeBanner: false,
            routes: {
              HomePage.route: (_) => HomePage(),
              FavPage.route: (_) => FavPage(),
              HiddenPage.route: (_) => HiddenPage(),
              SettingsPage.route: (_) => SettingsPage(),
              ProfilePage.route: (_) => ProfilePage(),
              OnboardingPage.route: (_) => OnboardingPage(),
              AllArticlesPage.route: (_) => AllArticlesPage(),
            },
            home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticationUninitialized) {
                  return SplashPage();
                }
                if (state is AuthenticationAuthenticated) {
                  return HomePage();
                }
                if (state is AuthenticationUnauthenticated) {
                  return AuthenticationPage(
                    userRepository: UserRepository(),
                  );
                }
                if (state is AuthenticationLoading) {
                  return LoadingIndicator();
                }
              },
            ),
          );
        });
  }
}
