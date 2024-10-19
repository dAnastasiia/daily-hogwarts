part of 'classmates_bloc.dart';

@immutable
sealed class ClassmatesEvent {}

class FetchClassmates extends ClassmatesEvent {
  final String house;

  FetchClassmates(this.house);
}
