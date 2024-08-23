import 'package:flutter/material.dart';

class SpellCard extends StatelessWidget {
  const SpellCard({
    super.key,
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
            ),
            const SizedBox(height: 8),
            Text(
              description,
            ),
            const Spacer(),
            // Bottom Buttons (Cross and Star)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.red,
                  iconSize: 40,
                  onPressed: () {
                    // Handle cross action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.spa_outlined),
                  color: Colors.yellow.shade700,
                  iconSize: 40,
                  onPressed: () {
                    // Handle star action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
