abstract class FavState {}

class FavInitialState extends FavState {}

class FavLoadingState extends FavState {}

class FavSuccessState extends FavState {
  final String message;

  FavSuccessState(this.message);
}

class FavErrorState extends FavState {
  final String error;

  FavErrorState(this.error);
}
