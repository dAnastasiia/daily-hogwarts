part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class FetchCharacters extends CharactersEvent {}
