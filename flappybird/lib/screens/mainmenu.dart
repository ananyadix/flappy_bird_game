import 'package:flappybird/game/flappygame.dart';
import 'package:flutter/material.dart';
import 'package:flappybird/game/assets.dart';

class MainMenu extends StatelessWidget {
  final FlappyGame game;
  static const String id="mainMenu";

  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return  GestureDetector(
        onTap: (){
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/menu.png"),)
          ),
        ),
      );
  }
}
