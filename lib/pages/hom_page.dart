import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/global.dart';
import 'game_page.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/animals/game.jpg"))),
        child: ListView(
          children: [
             Container(
               height: 100,
               width: 100,
               child: Lottie.asset("assets/lottie/bird.json"),
             ),
            InkWell(
              onTap: (){
                Global.list= Global.animals;
                Global.image="assets/animals/forest.jpg";
                Navigator.of(context).pushNamed(GamePage.id);

              },

              child: gameContainer("Animals Game", "assets/animals/animals.png"),
            ),
            InkWell(
              onTap: (){
                Global.list= Global.fruist;
                Global.image="assets/fruits/fruit_background.jpg";
                Navigator.of(context).pushNamed(GamePage.id);
              },
              child: gameContainer("Fruits Game", "assets/fruits/fruits.png"),
            ),
            InkWell(
              onTap: (){
                Global.list= Global.numbers;
                Global.image="assets/numbers/img.png";
                Navigator.of(context).pushNamed(GamePage.id);
              },
              child: gameContainer("Numbers Game", "assets/numbers/bg_num.png"),
            )
          ],
        ),
      ),
    );

  }

  gameContainer(name, image) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.brown.shade700, width: 5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 210,
            child: Image.asset(image),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown.shade700),
          )
        ],
      ),
    );
  }
}
