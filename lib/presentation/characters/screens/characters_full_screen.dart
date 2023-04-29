import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futurama_app/data/enums/gender.dart';
import 'package:futurama_app/data/models/character/character.dart';
import 'package:futurama_app/presentation/characters/components/sayings_panel.dart';

class CharactersFullScreen extends StatelessWidget {
  const CharactersFullScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                expandedHeight: 320.0,
                floating: false,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "${character.characterName.first} ${character.characterName.middle} ${character.characterName.last}",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  background: Hero(
                    tag: character.id,
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (_, __, ___) => Container(
                        color: Colors.grey,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline,
                        color: Colors.redAccent,
                      ),
                      imageUrl: character.characterImage.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Biography:",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Table(
                            defaultColumnWidth: const IntrinsicColumnWidth(),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              /// Gender
                              TableRow(
                                children: <Widget>[
                                  Text(
                                    "Gender",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Chip(
                                      label: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            character.gender.value,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            character.gender == Gender.male
                                                ? Icons.male
                                                : Icons.female,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Species
                              TableRow(
                                children: <Widget>[
                                  Text(
                                    "Species",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Chip(
                                      label: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            character.species,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(Icons.person_4_outlined),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),




                              /// Home Planet
                              character.homePlanet != null
                                  ? TableRow(
                                      children: <Widget>[
                                        Text(
                                          "Home Planet",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Chip(
                                          label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                character.homePlanet!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Icon(Icons.language),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : const TableRow(
                                      children: [
                                        SizedBox.shrink(),
                                        SizedBox.shrink(),
                                      ],
                                    ),



                            ],
                          ),

                          /// Occupation
                          character.occupation.isNotEmpty ? Row(
                            children: [
                              Text(
                                "Occupation",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(character.occupation),
                                      ),
                                    );
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Chip(
                                      label: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              character.occupation,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.construction_outlined,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ) : const SizedBox.shrink(),

                          /// Saying
                          SayingsPanel(sayings: character.sayings),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
