import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/characters/characters_view_model.dart';
import 'package:futurama_app/presentation/characters/components/character_card.dart';
import 'package:futurama_app/presentation/characters/screens/characters_full_screen.dart';
import 'package:provider/provider.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    context.read<CharactersViewModel>().fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<CharactersViewModel>(
      builder: (_, model, __) => model.requestState.maybeWhen(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (message) => Center(
          child: Text(message),
        ),
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
        success: (characters) {
          if (characters == null) {
            return const Center(child: Text("Data not available"),);
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(
                  "Characters",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      final character = characters[index];
                      return CharacterCard(
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
                      );
                    },
                    childCount: characters.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
