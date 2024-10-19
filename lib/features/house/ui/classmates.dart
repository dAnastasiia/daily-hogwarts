import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_message.dart';
import 'package:daily_hogwarts/core/ui/loading_indicator.dart';
import 'package:daily_hogwarts/core/ui/prettified_field_value.dart';
import 'package:daily_hogwarts/core/utils/enums/house.dart';
import 'package:daily_hogwarts/features/house/bloc/classmates/classmates_bloc.dart';
import 'package:daily_hogwarts/features/house/ui/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
          Selector<AuthViewModel, House>(
            selector: (_, provider) => provider.house,
            builder: (_, house, ___) => BlocProvider(
              create: (_) => ClassmatesBloc()..add(FetchClassmates(house.name)),
              child: BlocBuilder<ClassmatesBloc, ClassmatesState>(
                builder: (_, state) {
                  return switch (state) {
                    ClassmatesLoading() => const LoadingIndicator(),
                    ClassmatesSuccess() =>
                      _ClassmatesList(classmates: state.classmates),
                    ClassmatesError() => CustomMessage(
                        message: state.error,
                        buttonText: t.repeat,
                        onPressed: () => context
                            .read<ClassmatesBloc>()
                            .add(FetchClassmates(house.name)),
                      ),
                  };
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClassmatesList extends StatelessWidget {
  final List<Character> classmates;

  const _ClassmatesList({
    required this.classmates,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        itemCount: classmates.length,
        itemBuilder: (_, index) {
          final student = classmates[index];
          return StudentCard(student: student);
        },
        controller: PageController(
          viewportFraction: 0.85,
        ),
      ),
    );
  }
}
