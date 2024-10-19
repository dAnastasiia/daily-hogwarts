part of 'classmates_bloc.dart';

@immutable
sealed class ClassmatesState {}

class ClassmatesLoading extends ClassmatesState {}

class ClassmatesSuccess extends ClassmatesState {
  final List<Character> classmates;

  ClassmatesSuccess(this.classmates);
}

class ClassmatesError extends ClassmatesState {
  final String error;

  ClassmatesError({required this.error});
}
