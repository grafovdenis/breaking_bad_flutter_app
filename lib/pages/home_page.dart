import 'package:breaking_bad_flutter_app/bloc/characters_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/deaths_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/episodes_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/quotes_bloc.dart';
import 'package:breaking_bad_flutter_app/pages/deaths_page.dart';
import 'package:breaking_bad_flutter_app/pages/quotes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'characters_page.dart';
import 'episodes_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Characters"),
                Tab(text: "Episodes"),
                Tab(text: "Quotes"),
                Tab(text: "Deaths")
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            BlocProvider(
              builder: (context) => CharactersBloc()..add(Fetch()),
              child: CharactersPage(),
            ),
            BlocProvider(
              builder: (context) => EpisodesBloc()..add(Fetch()),
              child: EpisodesPage(),
            ),
            BlocProvider(
                builder: (context) => QuotesBloc()..add(Fetch()),
                child: QuotesPage()),
            BlocProvider(
              builder: (context) => DeathsBloc()..add(Fetch()),
              child: DeathsPage(),
            )
          ])),
    );
  }
}
