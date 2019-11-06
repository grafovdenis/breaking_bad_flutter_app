import 'package:breaking_bad_flutter_app/bloc/characters_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';
import 'package:breaking_bad_flutter_app/widgets/character_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatefulWidget {
  CharactersPage({Key key}) : super(key: key);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    final charactersBloc = BlocProvider.of<CharactersBloc>(context);

    return BlocBuilder<CharactersBloc, PostState>(
      bloc: charactersBloc,
      builder: (context, state) {
        if (state is PostUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostError) {
          return Center(
            child: Text("Failed to fetch characters"),
          );
        }
        if (state is CharactersLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text("No posts"),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return CharacterWidget(character: state.posts[index]);
            },
            itemCount: state.posts.length,
          );
        }
      },
    );
  }
}
