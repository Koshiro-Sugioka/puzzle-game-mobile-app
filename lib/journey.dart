import 'package:flutter/material.dart';
import 'package:new_game_0730/characters_list.dart';
import 'package:new_game_0730/gacha.dart';
import 'package:new_game_0730/game_1.dart';

import 'widgets/my_bottom_app_bar.dart';

class Journey extends StatelessWidget  {
  final List<String> journies = <String>['The First','The Second','The Third','The Fourth','The Fifth'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Jouney'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: journies.length,
        itemBuilder: (BuildContext context,int index) {
          return Container(
            color: Colors.yellow[600],
            child: Center(child: TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Game1()),
                );
              }, child: Text(journies[index],style: TextStyle(color: Colors.black, fontSize: 30),),
            ),),
          );
        }, separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 2,
        color: Colors.black,
      ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}