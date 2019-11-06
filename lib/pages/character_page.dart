import 'package:intl/intl.dart';
import 'package:breaking_bad_flutter_app/data/character.dart';
import 'package:breaking_bad_flutter_app/widgets/photo_hero.dart';
import 'package:flutter/material.dart';

class CharacterPage extends StatelessWidget {
  final Character character;
  const CharacterPage({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String birthDate;
    if (character.birthday != "Unknown") {
      final rawFormatter = DateFormat('MM-dd-yyyy');
      final date = rawFormatter.parse(character.birthday);
      final formatter = DateFormat.yMMMd();
      birthDate = formatter.format(date);
    } else
      birthDate = character.birthday;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        final _image = Image.network(character.img, fit: BoxFit.fitWidth);
        final image = PhotoHero(
          image: _image,
          width: MediaQuery.of(context).size.width,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(),
                    body: Center(
                      child: PhotoHero(
                        image: _image,
                        title: character.name,
                        width: MediaQuery.of(context).size.width,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
                fullscreenDialog: true));
          },
        );
        return <Widget>[
          SliverAppBar(
            expandedHeight: 400,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(character.name),
              background: image,
            ),
          ),
        ];
      },
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(character.nickname),
            subtitle: Text("Nickname"),
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text(birthDate),
            subtitle: Text("Birthdate"),
          ),
          ListTile(
            leading: Icon(Icons.sentiment_neutral),
            title: Text(character.status),
            subtitle: Text("Status"),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text(character.occupation.join("\n")),
            subtitle: Text("Occupation"),
          ),
          (character.appearance.isNotEmpty)
              ? ListTile(
                  leading: Icon(Icons.movie),
                  title: Text(character.appearance.join(', ')),
                  subtitle: Text("Appearance in seasons"),
                )
              : Container(),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(character.portrayed),
            subtitle: Text("Actor"),
          ),
        ],
      ),
    ));
  }
}
