import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappybird/game/flappygame.dart';
import 'package:flappybird/screens/gameover.dart';
import 'package:flappybird/screens/mainmenu.dart';
import 'package:flutter/cupertino.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final game=FlappyGame();
  runApp(GameWidget(
      game: game,
      initialActiveOverlays:const [MainMenu.id],
      overlayBuilderMap: {
        'gameOver':(context,_)=>GameOver(game: game),
        'mainMenu':(context,_)=>MainMenu(game: game)
      },
  )
  );
}

