import 'dart:convert';

import 'package:breaking_bad_flutter_app/data/character.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';

class CharactersBloc extends Bloc<PostEvent, PostState> {
  @override
  get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts();
          yield CharactersLoaded(posts: posts);
          return;
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  Future<List<Character>> _fetchPosts() async {
    print("Fetching characters");
    final response =
        await http.get('https://breakingbadapi.com/api/characters');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        try {
          return Character(
              id: rawPost['char_id'],
              name: rawPost['name'],
              birthday: rawPost['birthday'],
              occupation: rawPost['occupation'],
              img: rawPost['img'],
              status: rawPost['status'],
              nickname: rawPost['nickname'],
              appearance: rawPost['appearance'],
              portrayed: rawPost['portrayed'],
              category: rawPost['category']);
        } catch (e) {
          print("$e, $rawPost");
        }
      }).toList();
    } else {
      throw Exception("Error fetching characters: ${response.body}");
    }
  }
}
