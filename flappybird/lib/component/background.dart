import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/flappygame.dart';

class Background extends SpriteComponent with HasGameRef<FlappyGame>{
  Background();
  @override
  Future<void> onLoad() async{
    final background=await Flame.images.load(AppAssets.background);
    size=gameRef.size;
    sprite=Sprite(background);
  }
}