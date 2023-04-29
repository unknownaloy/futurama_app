import 'package:flutter/material.dart';

class SayingsPanel extends StatelessWidget {
  const SayingsPanel({
    Key? key,
    required this.sayings,
  }) : super(key: key);

  final List<String> sayings;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(right: 24),
      title: Text(
        "Sayings",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      children: List.generate(
        sayings.take(10).length,
        (index) {
          final saying = sayings[index];
          return ListTile(
            leading: Text(
              "${index + 1}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            title: Text(
              saying,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
      ),
    );
  }
}
