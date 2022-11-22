import 'package:flutter/material.dart';


 abstract class Character{
  late int HP;
  late int power;
  late int cure;
  late int defence;
  int level = 1;
  late String name;
  late String imageIcon;
  late int rarity;
  late int id;
  final int red = 1;
  final int blue = 2;
  final int green = 3;
  final int yellow = 4;
  final int purple = 5;
  final int pink = 6;
  late int type;

  levelUp(){
    HP = (HP*1.1+10*level).toInt();
    power = (power*1.1+10*level).toInt();
    cure = (cure*1.1+10*level).toInt();
    level += 1;
  }
}

class Man extends Character{
  Man(){
    HP = 100;
    power = 150;
    cure = 50;
    defence = 0;
    rarity = 1;
    name = 'Man';
    imageIcon = 'images/Man.png';
    id = 1;
    type = red;
  }
}

class JK extends Character{
  JK(){
    HP = 100;
    power = 100;
    cure = 100;
    defence = 0;
    rarity = 1;
    name = 'JK';
    imageIcon = 'images/JK.png';
    id = 2;
    type = blue;
  }
}

class Grandpa extends Character{
  Grandpa(){
    HP = 150;
    power = 100;
    cure = 50;
    defence = 0;
    rarity = 1;
    name = 'Grandpa';
    imageIcon = 'images/Grandpa.png';
    id = 3;
    type = green;
  }
}


class Bob extends Character{
  Bob(){
    HP = 200;
    power = 120;
    cure = 50;
    defence = 0;
    rarity = 2;
    name = 'Bob';
    imageIcon = 'images/Bob.png';
    id = 4;
    type = red;
  }
}

class Donald extends Character{
  Donald(){
    HP = 150;
    power = 200;
    cure = 100;
    defence = 0;
    rarity = 2;
    name = 'Donald';
    imageIcon = 'images/Donald.png';
    id = 5;
    type = blue;
  }
}

class Sam extends Character{
  Sam(){
    HP = 150;
    power = 130;
    cure = 100;
    defence = 0;
    rarity = 2;
    name = 'Sam';
    imageIcon = 'images/Sam.png';
    id = 6;
    type = green;
  }
}

class Tom extends Character{
  Tom(){
    HP = 120;
    power = 120;
    cure = 70;
    defence = 0;
    rarity = 2;
    name = 'Tom';
    imageIcon = 'images/Tom.png';
    id = 7;
    type = purple;
  }
}

class Chicken extends Character{
  Chicken(){
    HP = 50;
    power = 50;
    cure = 200;
    defence = 0;
    rarity = 3;
    name = 'Chicken';
    imageIcon = 'images/Chicken.png';
    id = 8;
    type = red;
  }
}

class Kan extends Character{
  Kan(){
    HP = 50;
    power = 300;
    cure = 50;
    defence = 0;
    rarity = 3;
    name = 'Kan';
    imageIcon = 'images/Kan.png';
    id = 9;
    type = blue;
  }
}

class Goat extends Character{
  Goat(){
    HP = 300;
    power = 50;
    cure = 30;
    defence = 0;
    rarity = 3;
    name = 'Goat';
    imageIcon = 'images/Goat.png';
    id = 10;
    type = green;
  }
}

class Boy extends Character{
  Boy(){
    HP = 250;
    power = 180;
    cure = 50;
    defence = 0;
    rarity = 4;
    name = 'Boy';
    imageIcon = 'images/Boy.png';
    id = 11;
    type = red;
  }
}

class Father extends Character{
  Father(){
    HP = 150;
    power = 250;
    cure = 50;
    defence = 0;
    rarity = 4;
    name = 'Father';
    imageIcon = 'images/Father.png';
    id = 12;
    type = blue;
  }
}

class Mother extends Character{
  Mother(){
    HP = 150;
    power = 100;
    cure = 200;
    defence = 0;
    rarity = 4;
    name = 'Mother';
    imageIcon = 'images/Mother.png';
    id = 13;
    type = green;
  }
}

class Farmer extends Character{
  Farmer(){
    HP = 200;
    power = 100;
    cure = 150;
    defence = 0;
    rarity = 4;
    name = 'Farmer';
    imageIcon = 'images/Farmer.png';
    id = 14;
    type = yellow;
  }
}

class Family extends Character{
  Family(){
    HP = 200;
    power = 150;
    cure = 120;
    defence = 0;
    rarity = 4;
    name = 'Family';
    imageIcon = 'images/Family.png';
    id = 15;
    type = purple;
  }
}

class Koshiro extends Character{
  Koshiro(){
    HP = 250;
    power = 280;
    cure = 80;
    defence = 0;
    rarity = 5;
    name = 'Koshiro';
    imageIcon = 'images/Koshiro.png';
    id = 16;
    type = purple;
  }
}

class Becky extends Character{
  Becky(){
    HP = 100;
    power = 100;
    cure = 100;
    defence = 0;
    rarity = 2;
    name = 'Becky';
    imageIcon = 'images/Becky.png';
    id = 17;
    type = yellow;
  }
}




















