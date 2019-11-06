import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:breaking_bad_flutter_app/data/death.dart';
import 'package:breaking_bad_flutter_app/data/episode.dart';
import 'package:breaking_bad_flutter_app/data/quote.dart';
import 'package:breaking_bad_flutter_app/data/character.dart';

Future<List<Character>> fetchCharacters() async {
  print("Fetching characters");
  final response = await http.get('https://breakingbadapi.com/api/characters');
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as List;
    return data.map((rawPost) {
      try {
        return Character(
            id: rawPost['char_id'],
            name: rawPost['name'],
            birthday: rawPost['birthday'],
            occupation: rawPost['occupation'],
            img: rawPost['img'],
            status: rawPost['status'],
            nickname: rawPost['nickname'],
            appearance: rawPost['appearance'],
            portrayed: rawPost['portrayed'],
            category: rawPost['category']);
      } catch (e) {
        print("$e, $rawPost");
      }
    }).toList();
  } else {
    throw Exception("Error fetching characters: ${response.body}");
  }
}

Future<List<Death>> fetchDeaths() async {
  print("Fetching deaths");
  final response = await http.get("https://breakingbadapi.com/api/deaths");
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    return data.map((rawPost) {
      try {
        return Death(
            id: rawPost['death_id'],
            death: rawPost['death'],
            cause: rawPost['cause'],
            responsible: rawPost['responsible'],
            lastWords: rawPost['last_words'],
            season: rawPost['season'],
            episode: rawPost['episode'],
            numberOfDeaths: rawPost['num_number_of_deaths']);
      } catch (e) {
        print("$e, $rawPost");
      }
    }).toList();
  } else {
    throw Exception("Error fetching deaths: ${response.body}");
  }
}

Future<List<Episode>> fetchEpisodes() async {
  print("Fetching episodes");
  final response = await http.get('https://breakingbadapi.com/api/episodes');
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    return data.map((rawPost) {
      try {
        return Episode(
            id: rawPost['episode_id'],
            title: rawPost['title'],
            season: int.parse(rawPost['season']),
            episode: int.parse(rawPost['episode']),
            airDate: rawPost['air_date'],
            characters: rawPost['characters'],
            series: rawPost['series']);
      } catch (e) {
        print("$e, $rawPost");
      }
    }).toList();
  } else {
    throw Exception("Error fetching data: ${response.body}");
  }
}

Future<List<Quote>> fetchQuotes() async {
  print("Fetching quotes");
  final resposnse = await http.get("https://breakingbadapi.com/api/quotes");
  if (resposnse.statusCode == 200) {
    final date = json.decode(resposnse.body) as List;
    return date.map((rawPost) {
      try {
        return Quote(
            id: rawPost['quote_id'],
            quote: rawPost['quote'],
            author: rawPost['author'],
            series: rawPost['series']);
      } catch (e) {
        print("$e, $rawPost");
      }
    }).toList();
  } else {
    throw Exception("Error fetching quotes: ${resposnse.body}");
  }
}
