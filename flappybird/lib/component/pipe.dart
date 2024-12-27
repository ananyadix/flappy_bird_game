import 'package:flame/collisions.dart';
import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/flappygame.dart';
import 'package:flappybird/game/pipepos.dart';
import 'package:flappybird/game/config.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyGame>{
  Pipe({required this.height,required this.pipePosition});
  @override
  final double height;
  final PipePost pipePosition;
  @override
  Future<void> onLoad() async{
    final pipeUp=await Flame.images.load(AppAssets.pipeup);
    final pipeDown=await Flame.images.load(AppAssets.pipedown);
    size=Vector2(20, height);
    switch(pipePosition){
      case PipePost.up:
        position.y=0;
        sprite=Sprite(pipeUp);
        break;
      case PipePost.down:
        position.y=gameRef.size.y-size.y-Config.groundHeight;
        sprite=Sprite(pipeDown);
    }
    add(RectangleHitbox());
  }
}