import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttter_rick_and_morty/constants/my_colors.dart';
import 'package:fluttter_rick_and_morty/data/models/charracters_response.dart';

class CharacterItem extends StatelessWidget {
  CharacterItem({super.key, required this.character});

  Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        footer: Container(
          color: Colors.black45,
          padding: const EdgeInsets.only(top: 8,bottom: 8),
          child: Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            character.name ?? '',
            style: TextStyle(color: MyColors.white, fontSize: 15,fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,

          ),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: character.image ?? '',
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
            color: MyColors.yellow,
          )),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
