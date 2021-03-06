import 'package:bloc/bloc.dart';

import 'package:breaking_bad_flutter_app/api/endpoints.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';

class QuotesBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await fetchQuotes();
          yield QuotesLoaded(posts: posts);
          return;
        }
      } catch (_) {
        print(_);
        yield PostError();
      }
    }
  }
}
