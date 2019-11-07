import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/characters_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/pages/characters_page.dart';

class Characters extends StatefulWidget {
  Characters({Key key}) : super(key: key);

  @override
  _CharactersState createState() => _CharactersState();
}

class _CharactersState extends State<Characters>
    with AutomaticKeepAliveClientMixin<Characters> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => CharactersBloc()..add(Fetch()),
      child: CharactersPage(),
    );
  }
}
