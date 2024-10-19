import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/core/extensions/screen_size_extension.dart';
import 'package:daily_hogwarts/core/ui/custom_avatar.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentCard extends StatelessWidget {
  final Character student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final isWideScreen = context.isWideScreen;

    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.characterDetails.name,
        pathParameters: {'id': student.id},
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAvatar(
                src: student.image,
                radius: 50,
              ),
              SizedBox(width: isWideScreen ? 8 : 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: TextStyle(
                        fontSize: isWideScreen ? 16 : 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (student.alternateNames.isNotEmpty)
                      Text(
                        student.alternateNames.join(', '),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isWideScreen ? 14 : 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
