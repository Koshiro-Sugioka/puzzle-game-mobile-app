import 'package:flutter/material.dart';
import 'package:new_game_0730/characters_list.dart';
import 'package:new_game_0730/gacha.dart';
import '../journey.dart';
import '../test.dart';

class MyBottomAppBar extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
      return BottomAppBar(
        color: Colors.yellow,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Journey()),
                  );
                }, child: Text('Home',style: TextStyle(color: Colors.black),),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CharactersList()),
                  );
                }, child: Text('Character',style: TextStyle(color: Colors.black),),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Gacha()),
                  );
                }, child: Text('Gacha',style: TextStyle(color: Colors.black),),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Test()),
                  );
                }, child: Text('?',style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      );
    throw UnimplementedError();
  }
}

