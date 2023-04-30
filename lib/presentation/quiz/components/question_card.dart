import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.possibleAnswer,
    this.isSelected = false,
    required this.onSelected,
  }) : super(key: key);

  final String possibleAnswer;
  final bool isSelected;
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(possibleAnswer),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff7BC7EF).withOpacity(0.5) : null,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? null : Border.all(
            color: Colors.black,
          ),
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(4),
            alignment: Alignment.center,
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: isSelected ? null : Border.all(color: Colors.black),
              color: isSelected ? const Color(0xff3474EF) : null,
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : null,
          ),
          title: Text(
            possibleAnswer,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
