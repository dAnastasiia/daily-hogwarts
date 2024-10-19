import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/ui/custom_avatar.dart';
import 'package:daily_hogwarts/core/ui/custom_message.dart';
import 'package:daily_hogwarts/core/ui/prettified_field_value.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:daily_hogwarts/features/house/bloc/teachers/teachers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Teachers extends StatelessWidget {
  const Teachers({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 48.0,
              right: 16.0,
              bottom: 16.0,
              left: 16.0,
            ),
            child: PrettifiedFieldValue(title: t.teachers),
          ),
          BlocProvider(
            create: (_) => TeachersBloc()..add(FetchTeachers()),
            child: BlocBuilder<TeachersBloc, TeachersState>(
              builder: (_, state) {
                return switch (state) {
                  TeachersLoading() => const Center(
                      heightFactor: 64.0,
                      child: CircularProgressIndicator(),
                    ),
                  TeachersSuccess() => _TeachersList(teachers: state.teachers),
                  TeachersError() => CustomMessage(
                      message: state.error,
                      buttonText: t.repeat,
                      onPressed: () =>
                          context.read<TeachersBloc>().add(FetchTeachers()),
                    ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TeachersList extends StatelessWidget {
  final List<Character> teachers;

  const _TeachersList({
    required this.teachers,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return SizedBox(
      height: 160.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        separatorBuilder: (_, __) => const SizedBox(width: 32),
        itemCount: teachers.length,
        itemBuilder: (_, index) {
          final teacher = teachers[index];
          return GestureDetector(
            onTap: () => context.pushNamed(
              Routes.characterDetails.name,
              pathParameters: {'id': teacher.id},
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAvatar(
                  src: teacher.image,
                  radius: 64,
                ),
                const SizedBox(height: 8),
                Text(teacher.name),
              ],
            ),
          );
        },
      ),
    );
  }
}
