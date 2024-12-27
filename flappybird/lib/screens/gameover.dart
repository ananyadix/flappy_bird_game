import 'package:flappybird/game/flappygame.dart';
import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  final FlappyGame game;
  const GameOver({Key? key,required this.game }): super(key:key) ;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.black38,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 70),
          Image.asset("assets/images/GAME OVER.png"),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: onRestart,style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
              child: const Text('Restart',
              style: TextStyle(fontSize: 20),))
        ],
      ),
    ),
  );
  void onRestart(){
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
