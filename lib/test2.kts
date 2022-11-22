import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_game_0730/characters_list.dart';
import 'package:new_game_0730/gacha.dart';
import 'package:new_game_0730/widgets/my_bottom_app_bar.dart';
import 'characters.dart';


class Test extends StatefulWidget {

    @override
    State<Test> createState () => _TestState();
}


class _TestState extends State < Test > {
    static List < Character > party =<Character>[Man(), JK(), Grandpa(), Koshiro()];
    List<PuzzleIcon> puzzleIconList = ListGenarator ().createIconList();




    @override
    Widget build (BuildContext context) {


        return Scaffold(
            backgroundColor: Colors. brown [400],
        appBar: AppBar(
        backgroundColor: Colors.yellow,
        ),
        body:Container(
        width: double.infinity,
        child: GridView.count(
        crossAxisCount: 6,
        children: List.generate(puzzleIconList.length, (index) {
        return Center(
            child: GestureDetector(
                    onTap:() {
            PuzzleIcon icon = puzzleIconList [index];
            if (index != 29) {
                if (puzzleIconList[index + 1].color == Colors.white) {
                    PuzzleIcon iconRight = puzzleIconList [index + 1];
                    puzzleIconList[index] = iconRight;
                    puzzleIconList[index + 1] = icon;
                }
            }if (index != 0) {
            if (puzzleIconList[index - 1].color == Colors.white) {
                PuzzleIcon iconLeft = puzzleIconList [index - 1];
                puzzleIconList[index] = iconLeft;
                puzzleIconList[index - 1] = icon;
            }
        }if (index < 24) {
            if (puzzleIconList[index + 6].color == Colors.white) {
                PuzzleIcon iconUnder = puzzleIconList [index + 6];
                puzzleIconList[index] = iconUnder;
                puzzleIconList[index + 6] = icon;
            }
        }if (index > 5) {
            if (puzzleIconList[index - 6].color == Colors.white) {
                PuzzleIcon iconAbove = puzzleIconList [index - 6];
                puzzleIconList[index] = iconAbove;
                puzzleIconList[index - 6] = icon;
            }
        }
            setState(() {});
        },
        child: Container(
        color: puzzleIconList[index].color,
        width: 60,
        height: 60,
        child: Text(index.toString()),
        ),
        ),
        );
    }),
        ),
        ),
        bottomNavigationBar: MyBottomAppBar(),
        );
    }
}

class PuzzleIcon {
    late double leftPos;
    late double topPos;
    late Color color;

    PuzzleIcon(double x, double y)
    {
        leftPos = x;
        topPos = y;
    }

    double getLeftPos()
    {
        return this.leftPos;
    }

    double getTopPos()
    {
        return this.topPos;
    }

    void setLeftPos(double d)
    {
        leftPos = d;
    }

    void setTopPos(double d)
    {
        topPos = d;
    }
}

class GreenIcon extends PuzzleIcon {
    GreenIcon(double x, double y) : super(x, y){
    color = Colors.green;
}
}

class RedIcon extends PuzzleIcon {
    RedIcon(double x, double y) : super(x, y){
    color = Colors.red;
}
}

class BlueIcon extends PuzzleIcon {
    BlueIcon(double x, double y) : super(x, y){
    color = Colors.blue;
}
}

class PinkIcon extends PuzzleIcon {
    PinkIcon(double x, double y) : super(x, y){
    color = Colors.pink;
}
}

class YellowIcon extends PuzzleIcon {
    YellowIcon(double x, double y) : super(x, y){
    color = Colors.yellow;
}
}

class PurpleIcon extends PuzzleIcon {
    PurpleIcon(double x, double y) : super(x, y){
    color = Colors.purple;
}
}

class WhiteIcon extends PuzzleIcon {
    WhiteIcon(double x, double y) : super(x, y){
    color = Colors.white;
}
}

class ListGenarator {
    ListGenarator()
    {}

    List<PuzzleIcon> createIconList()
    {
        List<PuzzleIcon> p =<PuzzleIcon>[];
        for (int i = 0; i < 29; i++){
        double? x;
        double? y;
        if (i < 6) {
            y = 0.0;
        } else if (i < 12) {
            y = 60.0;
        } else if (i < 18) {
            y = 120.0;
        } else if (i < 24) {
            y = 180.0;
        } else if (i < 30) {
            y = 240.0;
        }
        if (i == 0 || i % 6 == 0) {
            x = 0.0;
        } else if (i == 1 || i % 6 == 1) {
            x = 60.0;
        } else if (i == 2 || i % 6 == 2) {
            x = 120.0;
        } else if (i == 3 || i % 6 == 3) {
            x = 180.0;
        } else if (i == 4 || i % 6 == 4) {
            x = 240.0;
        } else if (i == 5 || i % 6 == 5) {
            x = 300.0;
        }
        int num = Random ().nextInt(6);
        switch(num) {
            case 0:
            p.add(RedIcon(x!, y!));
            break;
            case 1:
            p.add(GreenIcon(x!, y!));
            break;
            case 2:
            p.add(BlueIcon(x!, y!));
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
        p.add(WhiteIcon(300.0, 240.0));
        return p;
    }

}





