import 'package:flutter/material.dart';
import 'package:fluttter_rick_and_morty/constants/strings.dart';
import 'package:fluttter_rick_and_morty/presentation/screens/character_details_screen.dart';
import 'package:fluttter_rick_and_morty/presentation/screens/characters_screen.dart';

class AppRouter{
  Route? generateAppRoute(RouteSettings settings){
    switch (settings.name){
      case charactersScreenRoute:
        return MaterialPageRoute(builder: (_) => CharactersScreen());
      case charactersDetailsScreenRoute:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}