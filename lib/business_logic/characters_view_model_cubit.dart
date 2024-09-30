import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttter_rick_and_morty/data/models/charracters_response.dart';
import 'package:fluttter_rick_and_morty/data/repository/characters_repository.dart';

part 'characters_view_model_state.dart';

class CharactersViewModelCubit extends Cubit<CharactersViewModelState> {
  List<Character> characters = [];
  List<Character> searchedCharacters = [];

  CharactersRepository charactersRepository;
  CharactersViewModelCubit({required this.charactersRepository}) : super(CharactersViewModelInitial());

  Future<void> getCharacters() async{
     CharactersResponse? result = await charactersRepository.getCharacters();
     characters = result?.results as List<Character>;
     emit(CharactersViewModelLoaded(characters: characters));
  }

  Future<void> searchCharacters(String query) async{
    CharactersResponse? result = await charactersRepository.filterCharacters(characterName: query);
    searchedCharacters = result?.results as List<Character>;
    emit(CharactersViewModelLoaded(characters: searchedCharacters));
  }

  void stopSearch(){
    searchedCharacters = [];
    emit(CharactersViewModelLoaded(characters: characters));
  }

}
