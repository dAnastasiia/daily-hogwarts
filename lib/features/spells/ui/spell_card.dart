import 'package:flutter/material.dart';

class SpellCard extends StatelessWidget {
  final String name;
  final String description;

  const SpellCard({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.red,
                  iconSize: 48,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.local_fire_department_rounded),
                  color: Colors.yellow.shade700,
                  iconSize: 48,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
