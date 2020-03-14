import 'package:cognifeed_app/tags/tags_model.dart';
import 'package:meta/meta.dart';

abstract class TagState {}

class TagInitialState extends TagState {}

class TagLoadingState extends TagState {}

class TagFetchedState extends TagState {
  final TagArray tags;

  TagFetchedState({@required this.tags});
}

class TagErrorState extends TagState {
  final String error;

  TagErrorState(this.error);
}
