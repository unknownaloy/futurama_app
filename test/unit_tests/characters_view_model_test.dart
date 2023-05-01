import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_app/data/models/character/character.dart';
import 'package:futurama_app/data/models/character/character_image.dart';
import 'package:futurama_app/data/models/character/character_name.dart';
import 'package:futurama_app/data/unions/request_state.dart';
import 'package:futurama_app/presentation/characters/characters_view_model.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

void main() {
  late CharactersViewModel sut;
  late MockApiServices mockApiServices;

  setUp(() {
    mockApiServices = MockApiServices();

    sut = CharactersViewModel(apiServices: mockApiServices);
  });

  final characterData = [
    Character(
      id: 1,
      characterName: CharacterName(
        first: "Ellis",
        middle: "Chichebem",
        last: "Ifoegbu",
      ),
      characterImage: CharacterImage(image: "https://i.pravatar.cc/209"),
      species: "Human",
      occupation: "Software Engineer",
      sayings: ["The quick brown fox jumps over the lazy dog"],
    )
  ];

  void initializeCharacterViewModelWithData() {
    when(mockApiServices.getCharacters())
        .thenAnswer((_) async => characterData);
  }

  test("Test that initial values are correct", () {
    expect(sut.requestState, const RequestState.idle());
    expect(sut.characters, []);
  });

  group("fetchCharacters", () {
    test("fetchCharacters uses the mockApiServices", () async {
      initializeCharacterViewModelWithData();

      await sut.fetchCharacters();
      verify(mockApiServices.getCharacters()).called(1);
    });

    test("""indicates loading of data, 
    set characters to the one gotten from the service,
    indicates that the data is not being loaded anymore""", () async {
      initializeCharacterViewModelWithData();
      final future = sut.fetchCharacters();
      expect(sut.requestState, const RequestState.loading());
      await future;

      expect(sut.requestState, const RequestState.success());
      expect(sut.characters, characterData);
    });
  });
}
