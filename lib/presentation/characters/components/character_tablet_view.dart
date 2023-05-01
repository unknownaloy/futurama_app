import 'package:flutter/material.dart';
import 'package:futurama_app/data/models/character/character.dart';
import 'package:futurama_app/presentation/characters/components/character_card.dart';
import 'package:futurama_app/presentation/characters/screens/characters_full_screen.dart';

class CharacterTabletView extends StatelessWidget {
  const CharacterTabletView({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2 / 3,
        ),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return Semantics(
            label:
                "Image of ${character.characterName.first} ${character.characterName.middle} ${character.characterName.last}",
            child: CharacterCard(
              id: character.id,
              imageUrl: character.characterImage.image,
              fullName:
                  "${character.characterName.first} ${character.characterName.middle} ${character.characterName.last}",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CharactersFullScreen(character: character),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
