import 'package:flutter/material.dart';
import 'package:new_game_0730/gacha_result.dart';
import 'package:new_game_0730/journey.dart';
import 'characters.dart';
import 'characters_list.dart';
import 'widgets/my_bottom_app_bar.dart';

class Gacha extends StatelessWidget  {
  final List<String> journies = <String>['The First','The Second','The Third','The Fourth','The Fifth'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Gacha'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GachaResult()),
              );
            },
            child: Text('Get'),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}