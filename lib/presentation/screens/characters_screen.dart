import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttter_rick_and_morty/business_logic/characters_view_model_cubit.dart';
import 'package:fluttter_rick_and_morty/constants/my_colors.dart';
import 'package:fluttter_rick_and_morty/data/models/charracters_response.dart';
import 'package:fluttter_rick_and_morty/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      appBar: AppBar(title: const Text('Ricky & Morty',style: TextStyle(fontSize: 20,color: Colors.white),),centerTitle: true,backgroundColor: MyColors.yellow,),
      body: BlocBuilder<CharactersViewModelCubit, CharactersViewModelState>(
        bloc: BlocProvider.of<CharactersViewModelCubit>(context)..getCharacters(),
        builder: (context, state) {
          if (state is CharactersViewModelLoaded){
            return _buildCharactersList(state.characters);
          }else{
            return _buildLoadingWidget();
          }
        },
      )
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.yellow,),
    );
  }

  Widget _buildCharactersList(List<Character> characters) {
    return GridView.builder(
      itemCount: characters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 2/3
        ),
        shrinkWrap: true,
        padding: EdgeInsets.all(4),
        itemBuilder: (context,index){
        return CharacterItem(character: characters[index],);
        }
    );
  }
}
