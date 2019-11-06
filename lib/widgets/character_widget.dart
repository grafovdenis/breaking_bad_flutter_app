import 'package:breaking_bad_flutter_app/data/character.dart';
import 'package:breaking_bad_flutter_app/pages/character_page.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  const CharacterWidget({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
          title: Text(character.name),
          subtitle: Text(character.nickname),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(character.img),
          )),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return CharacterPage(character: character);
        }));
      },
    );
  }
}
