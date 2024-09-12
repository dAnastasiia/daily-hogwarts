import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/ui/prettified_field_value.dart';
import 'package:daily_hogwarts/core/utils/mock_characters.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Classmates extends StatelessWidget {
  const Classmates({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
              right: 16.0,
              left: 16.0,
            ),
            child: PrettifiedFieldValue(title: t.classmates),
          ),
          SizedBox(
            height: 200.0,
            child: PageView.builder(
              itemCount: students.length,
              itemBuilder: (_, index) {
                final student = students[index];

                return GestureDetector(
                  onTap: () => context.pushNamed(
                    Routes.characterDetails.name,
                    pathParameters: {'id': student.id},
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(student.image),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  student.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                if (student.alternateNames.isNotEmpty)
                                  Text(
                                    student.alternateNames.join(', '),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
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
              },
              controller: PageController(
                viewportFraction: 0.85,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
