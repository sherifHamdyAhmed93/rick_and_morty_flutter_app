
import 'package:dio/dio.dart';
import 'package:fluttter_rick_and_morty/constants/strings.dart';
import 'package:fluttter_rick_and_morty/data/models/charracters_response.dart';

class WebService{
  late Dio dio;

  WebService(){
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      receiveDataWhenStatusError: true,
        validateStatus:(_){return true;}
    );
    
    dio = Dio(options);
  }
  
  Future<CharactersResponse?> getCharacters() async{
    try{
      dynamic response = await dio.get('character');
      if (response.statusCode == 200) {
        // Map the response to the UserModel
        final userModel = CharactersResponse.fromJson(response.data);
        return userModel;
      } else {
        // Handle errors or non-200 status codes
        print('Error: ${response.statusCode}');
        return null;
      }
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  Future<CharactersResponse?> filterCharacters({required String characterName}) async{
    Map<String,String> params = {
      'name' :  characterName
    };
    try{
      var response = await dio.get('character/',queryParameters: params);
      print(response.realUri);
      if (response.statusCode == 200) {
        // Map the response to the UserModel
        final userModel = CharactersResponse.fromJson(response.data);
        return userModel;
      } else {
        // Handle errors or non-200 status codes
        print('Error: ${response.statusCode}');
        return null;
      }
    }catch (e){
      print(e.toString());
      return null;
    }
  }

}