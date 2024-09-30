part of 'characters_view_model_cubit.dart';

@immutable
sealed class CharactersViewModelState {}

final class CharactersViewModelInitial extends CharactersViewModelState {}
final class CharactersViewModelLoading extends CharactersViewModelState {}
final class CharactersViewModelLoaded extends CharactersViewModelState {
  List<Character> characters;
  CharactersViewModelLoaded({required this.characters});
}
