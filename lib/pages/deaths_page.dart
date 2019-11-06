import 'package:breaking_bad_flutter_app/bloc/deaths_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeathsPage extends StatefulWidget {
  DeathsPage({Key key}) : super(key: key);

  @override
  _DeathsPageState createState() => _DeathsPageState();
}

class _DeathsPageState extends State<DeathsPage> {
  @override
  Widget build(BuildContext context) {
    final deathsBloc = BlocProvider.of<DeathsBloc>(context);
    return BlocBuilder<DeathsBloc, PostState>(
      bloc: deathsBloc,
      builder: (context, state) {
        if (state is PostUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostError) {
          return Center(
            child: Text("Failed to fetch deaths"),
          );
        }
        if (state is DeathsLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text("No posts"),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.sentiment_very_dissatisfied),
                title: Text(
                    "${state.posts[index].death} by ${state.posts[index].responsible}"),
                subtitle: Text(state.posts[index].cause),
              );
            },
            itemCount: state.posts.length,
          );
        }
      },
    );
  }
}
