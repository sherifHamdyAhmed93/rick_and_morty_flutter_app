
import 'dart:convert';

import 'package:fluttter_rick_and_morty/data/models/charracters_response.dart';
import 'package:fluttter_rick_and_morty/data/web_service/web_service.dart';

class CharactersRepository{
  final WebService webService;
  CharactersRepository({required this.webService});

  Future<CharactersResponse?> getCharacters() async {
    final result = await webService.getCharacters();
    return result;
  }

  }