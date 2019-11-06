import 'dart:convert';

import 'package:breaking_bad_flutter_app/data/episode.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
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
          final posts = await _fetchPosts();
          yield EpisodesLoaded(posts: posts);
          return;
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  Future<List<Episode>> _fetchPosts() async {
    print("Fetching episodes");
    final response = await http.get('https://breakingbadapi.com/api/episodes');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((rawPost) {
        try {
          return Episode(
              id: rawPost['episode_id'],
              title: rawPost['title'],
              season: int.parse(rawPost['season']),
              episode: int.parse(rawPost['episode']),
              airDate: rawPost['air_date'],
              characters: rawPost['characters'],
              series: rawPost['series']);
        } catch (e) {
          print("$e, $rawPost");
        }
      }).toList();
    } else {
      throw Exception("Error fetching data: ${response.body}");
    }
  }
}
