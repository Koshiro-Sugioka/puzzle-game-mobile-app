import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'characters.dart';
import 'characters_list.dart';
import 'gacha.dart';
import 'journey.dart';
import 'widgets/my_bottom_app_bar.dart';

class CharacterInfo extends StatelessWidget {
  CharacterInfo(this.chara);
  final Character chara;

  Widget setStar(Character c){
    if(c.rarity == 1){
      return Image.asset('images/s1.png');
    }else if(c.rarity == 2){
      return Image.asset('images/s2.png');
    }else if(c.rarity == 3){
      return Image.asset('images/s3.png');
    }else if(c.rarity == 4){
      return Image.asset('images/s4.png');
    }else{
      return Image.asset('images/s5.png');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Info'),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40,top: 10,right: 0,bottom: 10),
                    child: Text(chara.name, style: TextStyle(fontSize: 40, color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40,top: 10,right: 10,bottom: 10),
                  child: setStar(chara),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(child: Image.asset(chara.imageIcon, width: 400, height: 400,)),
            ),
            Container(
              color: Colors.brown,
              width: double.infinity,
              height: 145,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40,top: 0,right: 0,bottom: 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('HP       : ${chara.HP.toString()}',style: TextStyle(fontSize: 30),textAlign: TextAlign.left,)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Power : ${chara.power.toString()}',style: TextStyle(fontSize: 30),textAlign: TextAlign.left,)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Cure    : ${chara.cure.toString()}',style: TextStyle(fontSize: 30),textAlign: TextAlign.left,)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
