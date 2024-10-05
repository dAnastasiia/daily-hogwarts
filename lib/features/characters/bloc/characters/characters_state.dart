part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersSuccess extends CharactersState {
  final List<Character> characters;

  CharactersSuccess(this.characters);
}

class CharactersError extends CharactersState {
  final String error;

  CharactersError({required this.error});
}
