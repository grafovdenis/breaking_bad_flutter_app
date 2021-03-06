import 'package:bloc/bloc.dart';

import 'package:breaking_bad_flutter_app/api/endpoints.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';

class EpisodesBloc extends Bloc<PostEvent, PostState> {
  @override
  get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await fetchEpisodes();
          yield EpisodesLoaded(posts: posts);
          return;
        }
      } catch (_) {
        yield PostError();
      }
    }
  }
}
