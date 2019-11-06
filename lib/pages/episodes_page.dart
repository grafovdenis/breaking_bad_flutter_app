import 'package:breaking_bad_flutter_app/bloc/episodes_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodesPage extends StatefulWidget {
  EpisodesPage({Key key}) : super(key: key);

  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  @override
  Widget build(BuildContext context) {
    final episodesBloc = BlocProvider.of<EpisodesBloc>(context);
    return BlocBuilder<EpisodesBloc, PostState>(
      bloc: episodesBloc,
      builder: (context, state) {
        if (state is PostUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostError) {
          return Center(
            child: Text("Failed to fetch episodes"),
          );
        }
        if (state is EpisodesLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text("No episodes"),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.posts[index].title),
                subtitle: Text(
                    "Season ${state.posts[index].season}, episode: ${state.posts[index].episode}"),
              );
            },
            itemCount: state.posts.length,
          );
        }
      },
    );
  }
}
