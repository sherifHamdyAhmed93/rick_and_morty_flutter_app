import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttter_rick_and_morty/business_logic/characters_view_model_cubit.dart';
import 'package:fluttter_rick_and_morty/constants/strings.dart';
import 'package:fluttter_rick_and_morty/data/repository/characters_repository.dart';
import 'package:fluttter_rick_and_morty/data/web_service/web_service.dart';
import 'package:fluttter_rick_and_morty/presentation/screens/character_details_screen.dart';
import 'package:fluttter_rick_and_morty/presentation/screens/characters_screen.dart';

class AppRouter{

  late CharactersRepository charactersRepository;
  late CharactersViewModelCubit charactersViewModel;

  AppRouter(){
    charactersRepository = CharactersRepository(webService: WebService());
    charactersViewModel = CharactersViewModelCubit(charactersRepository: charactersRepository);
  }

  Route? generateAppRoute(RouteSettings settings){
    switch (settings.name){
      case charactersScreenRoute:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (context) => charactersViewModel,
          child: CharactersScreen(),
        ));
      case charactersDetailsScreenRoute:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}