import 'package:flutter/material.dart';
import 'package:futurama_app/data/models/character/character.dart';
import 'package:futurama_app/presentation/characters/components/character_card.dart';
import 'package:futurama_app/presentation/characters/screens/characters_full_screen.dart';

class CharacterMobileView extends StatelessWidget {
  const CharacterMobileView({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final character = characters[index];
            return Semantics(
              label:
                  "Image of ${character.characterName.first} ${character.characterName.middle} ${character.characterName.last}",
              image: true,
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
          childCount: characters.length,
        ),
      ),
    );
  }
}
