import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/tags/tags_event.dart';
import 'package:cognifeed_app/tags/tags_model.dart';
import 'package:cognifeed_app/tags/tags_repository.dart';
import 'package:cognifeed_app/tags/tags_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  @override
  TagState get initialState => TagInitialState();

  @override
  Stream<TagState> mapEventToState(
    TagEvent event,
  ) async* {
    yield TagLoadingState();
    try {
      if (event is GetTagsEvent) {
        final TagArray tags = await TagRepository.getTags();
        yield TagFetchedState(tags: tags);
      }
    } catch (e) {
      TagErrorState(e.toString());
    }
  }
}
