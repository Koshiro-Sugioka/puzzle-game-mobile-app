import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_game_0730/characters_list.dart';
import 'package:new_game_0730/gacha.dart';
import 'package:new_game_0730/game_1.dart';
import 'package:new_game_0730/widgets/my_bottom_app_bar.dart';
import 'characters.dart';


class Test extends StatefulWidget  {

  @override
  State<Test> createState() => _TestState();
}


class _TestState extends State<Test> with TickerProviderStateMixin{
  static List<Character> party = <Character>[Man(),JK(),Grandpa(),Koshiro()];
  List<PuzzleIcon> puzzleIconList = ListGenarator().createIconList();

  double DX = 0.0;
  double DY = 0.0;
  double DXnew = 0.0;
  double DYnew = 0.0;
  int ind = 0;
  bool changed = false;
  double opacity = 1.0;
  List<Combo> combos = <Combo>[];
  int duration = 300;
  bool puzzled = false;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration:  Duration(milliseconds: duration*12),
        vsync: this
    );
    super.initState();
  }

  @override
  void dispose()
  {
    _animationController.dispose();

    super.dispose();
  }

  Animation<double> createAnimation(int order){
    final double begin = order*0.165;
    final double end = begin+0.165;
    return Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(begin, end, curve: Curves.fastOutSlowIn)
    ));
  }


  Widget _buildAnimation(int index) {

    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        if(puzzled && puzzleIconList[index].inCombo) {
          return FadeTransition(
            opacity: createAnimation(puzzleIconList[index].comboOrder),
            child: Container(
              color: puzzleIconList[index].color,
              width: 60,
              height: 60,
              child: Text(puzzleIconList[index].comboOrder.toString()),
            ),
          );
        }else{
          return Container(
            color: puzzleIconList[index].color,
            width: 60,
            height: 60,
            child: Text(index.toString()),
          );
        }
      },
    );
  }


  Duration check(double opacity){
    if(opacity == 1.0){
      return Duration(microseconds: 1);
    }else{
      return Duration(seconds: 1);
    }
  }


  List<List<PuzzleIcon>> checkRow(int i){
    int initI = i;
    List<PuzzleIcon> combo= <PuzzleIcon>[];
    List<PuzzleIcon> combo2= <PuzzleIcon>[];
    List<List<PuzzleIcon>> combos = <List<PuzzleIcon>>[];
    int phase = 1;
    int consecutiveNum = 1;
    while(i<(initI+5)) {
      bool con = true;
      while (con == true) {
        if(i < (initI+5)) {
          if (puzzleIconList[i].color == puzzleIconList[i + 1].color) {
            consecutiveNum += 1;
            if (phase == 1) {
              if (combo.length == 0) {
                combo.add(puzzleIconList[i]);
              }
              combo.add(puzzleIconList[i + 1]);
              if (i == initI + 4 && consecutiveNum >= 3) {
                combos.add(combo);
              }
            }else{
              if (combo2.length == 0) {
                combo2.add(puzzleIconList[i]);
              }
              combo2.add(puzzleIconList[i + 1]);
              if (i == initI + 4 && consecutiveNum >= 3) {
                combos.add(combo2);
              }
            }
            i += 1;
          }else{
            i += 1;
            if (consecutiveNum < 3) {
              if (phase == 1 && combo.length < 3) {
                combo.clear();
              }else{
                combo2.clear();
              }
              consecutiveNum = 1;
            } else if (consecutiveNum == 3 && i == (initI + 3)) {
              combos.add(combo);
              consecutiveNum = 1;
              phase = 2;
            } else {
              if (phase == 1) {
                combos.add(combo);
              }
              consecutiveNum = 1;
              break;
            }
            con = false;
          }
        }else{break;}
      }
    }
    return combos;
  }

  List<List<List<PuzzleIcon>>> makeRowComboList(){
    List<List<List<PuzzleIcon>>> allRowCombosList = <List<List<PuzzleIcon>>>[];
    for(int i=0;i<25;i +=6){
      allRowCombosList.add(checkRow(i));
    }
    return allRowCombosList;
  }

  List<Combo> makeRowCombos(){
    List<List<List<PuzzleIcon>>> rowList = makeRowComboList();
    List<Combo> allRowCombos = <Combo>[];
    for (List<List<PuzzleIcon>> rows in rowList){
      if(rows.isNotEmpty){
        for(List<PuzzleIcon> row in rows){
          List<PuzzleIcon> newComboList = <PuzzleIcon>[];
          for (PuzzleIcon rowIcon in row){
            newComboList.add(rowIcon);
          }
          Combo newCombo = Combo(newComboList, true, false);
          allRowCombos.add(newCombo);
        }
      }
    }
    return allRowCombos;
  }


  List<PuzzleIcon> checkColumn(int i){
    int initI = i;
    List<PuzzleIcon> combo= <PuzzleIcon>[];
    int consecutiveNum = 1;
    while(i<(initI+24)) {
      bool con = true;
      while (con == true) {
        if(i < (initI+24)) {
          if (puzzleIconList[i].color == puzzleIconList[i + 6].color) {
            consecutiveNum += 1;
              if (combo.length == 0) {
                combo.add(puzzleIconList[i]);
              }
              combo.add(puzzleIconList[i + 6]);
              if(i == (initI+18) && consecutiveNum < 3){
                combo.clear();
              }
            i += 6;
          }else{
            i += 6;
            if (consecutiveNum < 3) {
              combo.clear();
              consecutiveNum = 1;
            }else {
              break;
            }
            con = false;
          }
        }else{break;}
      }
    }
    return combo;
  }

  List<Combo> makeColumnCombos(){
    List<Combo> allColumnCombos = <Combo>[];
    for(int i = 0; i<6;i++){
      if(checkColumn(i).isNotEmpty) {
        allColumnCombos.add(Combo(checkColumn(i),false, true));
      }
    }
    return allColumnCombos;
  }

  List<Combo> makeBothCombos(List<Combo> rows, List<Combo> columns){
    rows.addAll(columns);
    return rows;
  }


  List<Combo> makeAllCombos(List<Combo> bothCombo) {
    List<Combo> combos = bothCombo;
    List<Combo> allCombos = <Combo>[];
    List<Combo> comboStrage = <Combo>[];
    for (Combo combo in combos) {
      if (!combo.edited) {
        Combo comboNew = checkCombo(combos, combo);
        allCombos.add(comboNew);
      }
    }
    return allCombos;
  }

  Combo checkCombo(List<Combo> bothCombos, Combo combo){
    List<Combo> combos = bothCombos;
    Combo comboNew= combo;
    for(Combo combo2 in combos){
      if(combo != combo2 && combo.color == combo2.color){
        Combo comboNew2= combo2;
        comboNew = combineTwoCombos(comboNew, comboNew2);
      }
    }
    return comboNew;
  }

  List<Combo> checkSameColorCombo(Combo combo){
    List<Combo> combos = <Combo>[];
    List<PuzzleIcon> combo1List = combo.icons;
    List<PuzzleIcon> comboNewList = <PuzzleIcon>[];
    for(PuzzleIcon icon1 in combo.icons){
      for(PuzzleIcon icon2 in combo.icons){
        if((icon1 != icon2)) {
          if ((icon1 != icon2)) {}
            if (((icon1.X == icon2.X) && ((icon1.Y - icon2.Y).abs() == 1)) ||
                ((icon1.Y == icon2.Y) && ((icon1.X - icon2.X).abs() == 1))) {
              if (!icon2.edited) {
                comboNewList.add(icon1);
              }
              icon1.edited = true;
            }
          }
      }
    }
    return combos;
  }


  Combo combineTwoCombos(Combo combo1,Combo combo2){

    List<PuzzleIcon> combo1List = combo1.icons;
    List<PuzzleIcon> combo2List = combo2.icons;
    List<int> overlapingIndex = <int>[];
    if((combo1.horizontal && combo2.vertical)||
        (combo1.vertical && combo2.horizontal)||
        (combo1.vertical && combo1.horizontal)){
      for(PuzzleIcon icon1 in combo1.icons){
        for(PuzzleIcon icon2 in combo2.icons){
          if((icon1.X == icon2.X) && (icon1.Y == icon2.Y)){
            overlapingIndex.add(combo1.icons.indexOf(icon1));
          }
        }
      }
      for(int i in overlapingIndex){
        combo1List.removeAt(i);
      }
    }
    combo1List.addAll(combo2List);
    bool h = false;
    bool v = false;
    if(combo1.horizontal || combo2.horizontal){
      h = true;
    }
    if(combo1.vertical || combo2.vertical){
      v = true;
    }
    combo1.horizontal = h;
    combo1.vertical = v;
    combo1.icons = combo1List;
    combo2.edited= true;
    return combo1;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
      body:Column(
        children: [
          Container(
            width: double.infinity,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 6,
              children: List.generate(puzzleIconList.length, (index) {
                return Center(
                  child: GestureDetector(
                    onPanUpdate: (DragUpdateDetails details){
                      PuzzleIcon icon = puzzleIconList[index+ind];
                      if(DX < 30.0 && DX > -30.0){
                        DX += details.delta.dx;
                      }else if(DX == 30.0 || DX == -30.0){
                        DXnew += details.delta.dx;
                      }
                      if(DY < 30.0 && DY > -30.0){
                        DY += details.delta.dy;
                      }else if(DY == 30.0 || DY == -30.0){
                        DYnew += details.delta.dy;
                      }
                      if (DX > 30.0 && icon.X != 6){
                        PuzzleIcon iconRight = puzzleIconList[index+ind+1];
                        puzzleIconList[index+ind] = iconRight;
                        puzzleIconList[index+ind + 1] = icon;
                        icon.X +=1;
                        iconRight.X -= 1;
                        ind += 1;
                        DX = 30.0;
                        setState(() {});
                      }else if(DXnew > 30.0){
                        DX =0;
                        DXnew = 0;
                      }else if (DX < -30.0 && icon.X != 1){
                        PuzzleIcon iconLeft = puzzleIconList[index+ind-1];
                        puzzleIconList[index+ind] = iconLeft;
                        puzzleIconList[index+ind -1] = icon;
                        icon.X -=1;
                        iconLeft.X += 1;
                        ind -= 1;
                        DX = -30.0;
                        setState(() {});
                      }else if(DXnew < -30.0){
                        DX =0;
                        DXnew = 0;
                      }else if (DY > 30.0 && icon.Y != 5){
                        PuzzleIcon iconUnder = puzzleIconList[index+ind+6];
                        puzzleIconList[index+ind] = iconUnder;
                        puzzleIconList[index+ind +6] = icon;
                        icon.Y +=1;
                        iconUnder.Y -=1;
                        ind += 6;
                        DY =30.0;
                        setState(() {});
                      }else if(DYnew > 30.0){
                        DY =0;
                        DYnew = 0;
                      }else if (DY < -30.0 && icon.Y != 1){
                        PuzzleIcon iconAbove = puzzleIconList[index+ind-6];
                        puzzleIconList[index+ind] = iconAbove;
                        puzzleIconList[index+ind - 6] = icon;
                        icon.Y -=1;
                        iconAbove.Y +=1;
                        ind -= 6;
                        DY =-30.0;
                        setState(() {});
                      }else if(DYnew < -30.0){
                        DY =0;
                        DYnew = 0;
                      }
                    },
                    onPanEnd: (DragEndDetails details){
                      puzzled = true;
                      opacity = 0.9;
                      combos = makeAllCombos(makeBothCombos(makeRowCombos(),makeColumnCombos()));
                      for(int i = 0; i<combos.length; i++){
                        for(PuzzleIcon icon in combos[i].icons){
                          icon.inCombo = true;
                          icon.comboOrder = i;
                        }
                      }
                      _animationController.forward(from: 0.0);
                      setState(() {});
                    },
                    child: _buildAnimation(index),
                  ),
                );
              }),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                List<Combo> combos = makeAllCombos(makeBothCombos(makeRowCombos(),makeColumnCombos()));
                print("---------");
                print(combos);
                print("---------");
              },
              child: Text("Check",style: TextStyle(fontSize: 40),),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

class PuzzleIcon{
  late int X;
  late int Y;
  late Color color;
  bool consecutive = false;
  bool edited = false;
  bool inCombo = false;
  late int comboOrder;
  
  PuzzleIcon(int x, int y){
    X = x;
    Y = y;
  }

}

class GreenIcon extends PuzzleIcon{
  GreenIcon(int x, int y) : super(x, y){
    color = Colors.green;
  }
}

class RedIcon extends PuzzleIcon{
  RedIcon(int x, int y) : super(x, y){
    color = Colors.red;
  }
}

class BlueIcon extends PuzzleIcon{
  BlueIcon(int x, int y) : super(x, y){
    color = Colors.blue;
  }
}

class PinkIcon extends PuzzleIcon{
  PinkIcon(int x, int y) : super(x, y){
    color = Colors.pink;
  }
}

class YellowIcon extends PuzzleIcon{
  YellowIcon(int x, int y) : super(x, y){
    color = Colors.yellow;
  }
}

class PurpleIcon extends PuzzleIcon{
  PurpleIcon(int x, int y) : super(x, y){
    color = Colors.purple;
  }
}



class Combo {
  late Color color;
  late List<PuzzleIcon> icons;
  late bool horizontal;
  late bool vertical;
  late int iconNum;
  bool edited = false;

  Combo(List<PuzzleIcon> iconList,bool h, bool v){
    icons = iconList;
    horizontal = h;
    vertical = v;
    iconNum = iconList.length;
    color = iconList[0].color;
  }

}


class ListGenarator{
  ListGenarator(){}

  List<PuzzleIcon> createIconList(){
    List<PuzzleIcon> p = <PuzzleIcon>[];
    for (int i = 0; i < 30; i++){
      int? x;
      int? y;
      if(i < 6){
        y = 1;
      }else if (i < 12){
        y = 2;
      }else if (i < 18){
        y = 3;
      }else if (i < 24){
        y = 4;
      }else if (i < 30){
        y = 5;
      }
      if(i == 0 || i % 6==0){
        x = 1;
      }else if(i == 1 || i % 6==1){
        x = 2;
      }else if(i == 2 || i % 6==2){
        x = 3;
      }else if(i == 3 || i % 6==3){
        x = 4;
      }else if(i == 4 || i % 6==4){
        x = 5;
      }else if(i == 5 || i % 6==5){
        x = 6;
      }
      int num = Random().nextInt(6);
      switch(num){
        case 0:
          p.add(RedIcon(x!,y!));
          break;
        case 1:
          p.add(GreenIcon(x!,y!));
          break;
        case 2:
          p.add(BlueIcon(x!,y!));
          break;
        case 3:
          p.add(PinkIcon(x!, y!));
          break;
        case 4:
          p.add(YellowIcon(x!, y!));
          break;
        case 5:
          p.add(PurpleIcon(x!, y!));
          break;
      }
    }
    return p;
  }

}





/*
                onTap: (){
                  PuzzleIcon icon = puzzleIconList[index];
                  if(index != 29){
                    if(puzzleIconList[index+1].color == Colors.white ) {
                      PuzzleIcon iconRight = puzzleIconList[index+1];
                      puzzleIconList[index] = iconRight;
                      puzzleIconList[index + 1] = icon;
                    }
                  }if(index != 0){
                    if (puzzleIconList[index-1].color  == Colors.white ){
                      PuzzleIcon iconLeft = puzzleIconList[index-1];
                      puzzleIconList[index] = iconLeft;
                      puzzleIconList[index -1] = icon;
                    }
                  }if(index < 24){
                    if (puzzleIconList[index+6].color  == Colors.white ){
                      PuzzleIcon iconUnder = puzzleIconList[index+6];
                      puzzleIconList[index] = iconUnder;
                      puzzleIconList[index +6] = icon;
                    }
                  }if(index > 5){
                    if (puzzleIconList[index-6].color == Colors.white ){
                      PuzzleIcon iconAbove = puzzleIconList[index-6];
                      puzzleIconList[index] = iconAbove;
                      puzzleIconList[index - 6] = icon;
                    }
                  }
                  setState(() {});
                },
                 */