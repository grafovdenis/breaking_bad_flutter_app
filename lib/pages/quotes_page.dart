import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_state.dart';
import 'package:breaking_bad_flutter_app/bloc/quotes_bloc.dart';

class QuotesPage extends StatefulWidget {
  QuotesPage({Key key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final quotesBloc = BlocProvider.of<QuotesBloc>(context);

    return BlocBuilder<QuotesBloc, PostState>(
      bloc: quotesBloc,
      builder: (context, state) {
        if (state is PostUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostError) {
          return Center(
            child: Text("Failed to fetch quotes"),
          );
        }
        if (state is QuotesLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text("No posts"),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  state.posts[index].quote,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                    "${state.posts[index].author}, ${state.posts[index].series}"),
              );
            },
            itemCount: state.posts.length,
          );
        }
        return Container();
      },
    );
  }
}
