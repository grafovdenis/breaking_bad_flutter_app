import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/deaths_bloc.dart';
import 'package:breaking_bad_flutter_app/pages/deaths_page.dart';

class Deaths extends StatefulWidget {
  Deaths({Key key}) : super(key: key);

  @override
  _DeathsState createState() => _DeathsState();
}

class _DeathsState extends State<Deaths>
    with AutomaticKeepAliveClientMixin<Deaths> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      builder: (context) => DeathsBloc()..add(Fetch()),
      child: DeathsPage(),
    );
  }
}