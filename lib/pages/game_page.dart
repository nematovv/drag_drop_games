
import 'package:flutter/material.dart';

import '../data/model_data.dart';
import '../widgets/global.dart';
class GamePage extends StatefulWidget {
  static final String id = "game_page";
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score = 0;
  int gameOver = 0;
  List<Content> list2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(var e in Global.list){
      list2.add(e);
    }
    list2.shuffle();

    for(var e in Global.list ){
      e.isDropped = false;

    }
    for(var e in list2){
      e.isDropped = false;

    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height*0.16;
    return  SafeArea(child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.9,
                fit: BoxFit.cover,
                image: AssetImage(Global.image)
            )
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(child: Row(
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: Global.list.map((e) {
                    int i = list2.indexOf(e);
                    return Global.list[i].isDropped==true
                        ?Container(
                      height: height,

                    )
                        :Draggable(
                      data: Global.list[i].text,
                      childWhenDragging: Container(
                        height: height,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                            Global.list[i].image
                        ),
                      ),
                      child: Container(
                        height: height,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(Global.list[i].image),
                      ),
                      feedback: SizedBox(
                        height: height,
                        child: Image.asset(Global.list[i].image),
                      ),

                    );

                  }).toList(),
                )),
                Expanded(child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: list2.map((e){
                      int i = list2.indexOf(e);
                      return list2[i].isDropped == true
                          ?Container(
                        height: height,
                      )
                          : DragTarget(
                          onAccept: (data){
                            if (list2[i].text==data){
                              setState((){
                                for(var e in Global.list){
                                  if (e.text==list2[i].text){
                                    e.isDropped = true;
                                  }
                                }
                                list2[i].isDropped=true;
                                score+=10;
                                gameOver++;
                                if(gameOver == Global.list.length){
                                  showDialog(context: context, builder: (context){
                                    return Container(

                                    );
                                  });
                                }
                              });

                            }else{
                              setState(() {
                                score-=10;
                              });
                            }

                          },
                          builder: (context,a,r)=>Container(
                            height: height,
                            alignment: Alignment.center,
                            child: Text(
                              list2[i].text,
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.brown .shade900,
                                      blurRadius: 10
                                  ),
                                  Shadow(
                                      color: Colors.black,
                                      blurRadius: 10
                                  ),
                                  Shadow(
                                      color: Colors.blue,
                                      blurRadius: 10
                                  ),
                                ],
                                letterSpacing: 1.5,
                                color: Colors.yellow.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,

                              ),
                            ),
                          )
                      );

                    }).toList()
                ),
                ),
              ],
            ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.white.withOpacity(0.5),
              padding: EdgeInsets.all(12),
              child: Text(
                "Your Score:$score",
                style: TextStyle(
                  color: Colors.brown.shade700,
                  fontWeight: FontWeight.w700,
             fontSize: 30),

              ),
            )
          ],
        ),
      ),

    ),
    );
  }
  void dialog(){}
}