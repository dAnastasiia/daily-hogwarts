part of 'character_bloc.dart';

@immutable
sealed class CharacterEvent {}

class FetchCharacter extends CharacterEvent {
  final String id;

  FetchCharacter(this.id);
}
