import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/theme/theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  bool isDarkTheme = false;
  @override
  bool get initialState => isDarkTheme;

  @override
  Stream<bool> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is DarkThemeEvent) {
      isDarkTheme = true;
      yield isDarkTheme;
    }
    if (event is LightThemeEvent) {
      isDarkTheme = false;
      yield isDarkTheme;
    }
  }
}
