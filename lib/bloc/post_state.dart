import 'package:breaking_bad_flutter_app/data/character.dart';
import 'package:breaking_bad_flutter_app/data/death.dart';
import 'package:breaking_bad_flutter_app/data/episode.dart';
import 'package:breaking_bad_flutter_app/data/quote.dart';

abstract class PostState {}

class PostUninitialized extends PostState {}

class PostError extends PostState {}

class CharactersLoaded extends PostState {
  final List<Character> posts;

  CharactersLoaded({this.posts});
}

class EpisodesLoaded extends PostState {
  final List<Episode> posts;

  EpisodesLoaded({this.posts});
}

class QuotesLoaded extends PostState {
  final List<Quote> posts;

  QuotesLoaded({this.posts});
}

class DeathsLoaded extends PostState {
  final List<Death> posts;

  DeathsLoaded({this.posts});
}