import 'dart:convert';

import "package:http/http.dart" as http;

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';
import 'package:breaking_bad_flutter_app/data/quote.dart';

class QuotesBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts();
          yield QuotesLoaded(posts: posts);
          return;
        }
      } catch (_) {
        print(_);
        yield PostError();
      }
    }
  }

  Future<List<Quote>> _fetchPosts() async {
    print("Fetching quotes");
    final resposnse = await http.get("https://breakingbadapi.com/api/quotes");
    if (resposnse.statusCode == 200) {
      final date = json.decode(resposnse.body) as List;
      return date.map((rawPost) {
        try {
          return Quote(
              id: rawPost['quote_id'],
              quote: rawPost['quote'],
              author: rawPost['author'],
              series: rawPost['series']);
        } catch (e) {
          print("$e, $rawPost");
        }
      }).toList();
    } else {
      throw Exception("Error fetching quotes: ${resposnse.body}");
    }
  }
}
