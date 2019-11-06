import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';
import 'package:breaking_bad_flutter_app/data/death.dart';

class DeathsBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts();
          yield DeathsLoaded(posts: posts);
          return;
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  Future<List<Death>> _fetchPosts() async {
    print("Fetching deaths");
    final response = await http.get("https://breakingbadapi.com/api/deaths");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((rawPost) {
        try {
          return Death(
              id: rawPost['death_id'],
              death: rawPost['death'],
              cause: rawPost['cause'],
              responsible: rawPost['responsible'],
              lastWords: rawPost['last_words'],
              season: rawPost['season'],
              episode: rawPost['episode'],
              numberOfDeaths: rawPost['num_number_of_deaths']);
        } catch (e) {
          print("$e, $rawPost");
        }
      }).toList();
    } else {
      throw Exception("Error fetching deaths: ${response.body}");
    }
  }
}
