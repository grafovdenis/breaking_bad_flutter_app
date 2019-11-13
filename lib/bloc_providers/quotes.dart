import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_flutter_app/bloc/post_event.dart';
import 'package:breaking_bad_flutter_app/bloc/quotes_bloc.dart';
import 'package:breaking_bad_flutter_app/pages/quotes_page.dart';

class Quotes extends StatefulWidget {
  Quotes({Key key}) : super(key: key);

  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes>
    with AutomaticKeepAliveClientMixin<Quotes> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      builder: (context) => QuotesBloc()..add(Fetch()),
      child: QuotesPage(),
    );
  }
}
