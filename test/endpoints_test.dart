import 'package:breaking_bad_flutter_app/data/death.dart';
import 'package:matcher/matcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:breaking_bad_flutter_app/api/endpoints.dart';
import 'package:breaking_bad_flutter_app/data/character.dart';

void main() {
  test('returns a List of Characters if the http call completes successfully',
      () async {
    expect(await fetchCharacters(), const TypeMatcher<List<Character>>());
  });
  test('returns a List of Deaths if the http call completes successfully',
      () async {
    expect(await fetchDeaths(), const TypeMatcher<List<Death>>());
  });
}
