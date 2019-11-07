import 'package:flutter/material.dart';
import 'package:breaking_bad_flutter_app/bloc_providers/characters.dart';
import 'package:breaking_bad_flutter_app/bloc_providers/episodes.dart';
import 'package:breaking_bad_flutter_app/bloc_providers/quotes.dart';
import 'package:breaking_bad_flutter_app/bloc_providers/deaths.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
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
            Characters(),
            Episodes(),
            Quotes(),
            Deaths(),
          ])),
    );
  }
}
