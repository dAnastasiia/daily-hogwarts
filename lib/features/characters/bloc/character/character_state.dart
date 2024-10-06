part of 'character_bloc.dart';

@immutable
sealed class CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterSuccess extends CharacterState {
  final Character character;

  CharacterSuccess(this.character);
}

class CharacterError extends CharacterState {
  final String error;

  CharacterError({required this.error});
}
