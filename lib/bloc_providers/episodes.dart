import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/episodes_bloc.dart';
import 'package:breaking_bad_flutter_app/pages/episodes_page.dart';

class Episodes extends StatefulWidget {
  Episodes({Key key}) : super(key: key);

  @override
  _EpisodesState createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes>
    with AutomaticKeepAliveClientMixin<Episodes> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => EpisodesBloc()..add(Fetch()),
      child: EpisodesPage(),
    );
  }
}