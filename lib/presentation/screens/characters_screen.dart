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

  TextEditingController _searchTextController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      appBar: _buildAppBar(),
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

  PreferredSizeWidget _buildAppBar(){
    return AppBar(
      title: _isSearching ? _buildSearchTextField() : _buildAppBarTitle(),
      actions: _buildAppBarActions(),
      leading: _isSearching ? const BackButton(color: MyColors.grey,) : Container(),
      backgroundColor: MyColors.yellow,
      );
  }

  Widget _buildAppBarTitle(){
    return  const Text('Ricky & Morty',style: TextStyle(fontSize: 20,color: Colors.white),);
  }

  Widget _buildSearchTextField(){
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.grey,
      decoration: const InputDecoration(
        hintText: 'Find A Character',
        hintStyle: TextStyle(fontSize: 15,color: MyColors.grey),
        border: InputBorder.none,
      ),
      style: const TextStyle(fontSize: 15,color: MyColors.grey),
      onChanged: (searchedText){
        BlocProvider.of<CharactersViewModelCubit>(context).searchCharacters(searchedText);
      },
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching){
      return [
        IconButton(onPressed: (){
          _clearSearch();
          Navigator.pop(context);
          BlocProvider.of<CharactersViewModelCubit>(context).stopSearch();
        }, icon: const Icon(Icons.clear),color: MyColors.grey,)
      ];
    }else{
      return [
        IconButton(onPressed: (){
          _startSearch();
        }, icon: const Icon(Icons.search),color: MyColors.grey,)
      ];
    }
  }

   void _startSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
   }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
    BlocProvider.of<CharactersViewModelCubit>(context).stopSearch();
  }

  void _clearSearch() {
    _searchTextController.clear();
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
