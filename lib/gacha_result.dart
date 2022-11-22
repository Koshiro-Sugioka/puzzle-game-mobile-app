import 'package:flutter/material.dart';
import 'package:new_game_0730/journey.dart';
import 'characters.dart';
import 'characters_list.dart';
import 'gacha.dart';
import 'dart:math';

import 'widgets/my_bottom_app_bar.dart';



class GachaResult extends StatelessWidget {
  static List<Character> characterList = <Character>[Man(),JK(),Grandpa()];

  List<Character> getList(){
    return characterList;
  }

  String? image;

  int num = Random().nextInt(100);

  late Character chara;

  @override
  Widget build(BuildContext context) {
    chara = createNewChara();
    characterList.add(chara);

    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Gacha'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                chara.imageIcon,
                width: 400,
                height: 400,
              ),
              Text(chara.name, style: TextStyle(fontSize: 50),),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GachaResult()),
                  );
                },
                child: Text('Get One More'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }


  Character createNewChara(){
    if(num < 10){
      return Man();
    }else if(num < 20){
      return JK();
    }else if(num < 30){
      return Grandpa();
    }else if(num < 38){
      return Becky();
    }else if(num < 46){
      return Bob();
    }else if(num < 54){
      return Donald();
    }else if(num < 62){
      return Sam();
    }else if(num < 70){
      return Tom();
    }else if(num < 74){
      return Chicken();
    }else if(num < 78){
      return Kan();
    }else if(num < 82){
      return Goat();
    }else if(num < 85 ){
      return Boy();
    }else if(num < 88){
      return Father();
    }else if(num < 91){
      return Mother();
    }else if(num < 94){
      return Farmer();
    }else if(num < 97){
      return Family();
    }else{
      return Koshiro();
    }
  }
}

