import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.fullName,
    required this.onTap,
  }) : super(key: key);

  final int id;
  final String imageUrl;
  final String fullName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (_, __, ___) => Container(
                        color: Colors.grey,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline,
                        color: Colors.redAccent,
                      ),
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                fullName,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
