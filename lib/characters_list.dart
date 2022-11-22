import 'package:flutter/material.dart';
import 'package:new_game_0730/gacha.dart';
import 'character_info.dart';
import 'gacha_result.dart';
import 'characters.dart';
import 'journey.dart';
import 'widgets/my_bottom_app_bar.dart';

class CharactersList extends StatefulWidget  {

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {

  //List<Character> characterList = <Character>[Man(),Man(),Man(),JK(),JK(),JK(),JK(),Grandpa(),Grandpa(),Grandpa()];
  List<Character> characterList = GachaResult().getList();


  sortChara(List<Character> l){
    var change = true;
    while(change){
      change = false;
      for(int i=0; i<l.length-1; i++){
        if(l[i].id > l[i+1].id){
          var ll = l[i];
          l[i] = l[i+1];
          l[i+1] = ll;
          change = true;
        }
      }
    }
    return l;
  }


  @override
  Widget build(BuildContext context) {
    List<Character> characters = sortChara(characterList);

    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Characters'),
      ),
      body: Container(
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(characters.length, (index) {
            return Center(
              child: TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CharacterInfo(characters[index])),
                  );
                },
                  child: Image.asset(characters[index].imageIcon, width: 80, height: 80,)),
            );
          }),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}