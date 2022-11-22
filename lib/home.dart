import 'package:flutter/material.dart';
import 'package:new_game_0730/journey.dart';


class Home extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/Home.png',
                width: 400,
                height: 400,
              ),
              OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Journey()),
                  );
                },
                child: const Text('Start', style: TextStyle(fontSize: 40, color: Colors.black),),
              ),
            ]
        ),
      ),
    );
  }
}