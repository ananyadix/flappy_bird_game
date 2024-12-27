import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/birdmov.dart';
import 'package:flappybird/game/flappygame.dart';
import 'package:flappybird/game/config.dart';
import 'package:flutter/animation.dart';

class Bird extends SpriteGroupComponent<BirdMove> with HasGameRef<FlappyGame>, CollisionCallbacks{
  Bird();
  @override
  Future<void> onLoad() async{
    final birdMid=await gameRef.loadSprite(AppAssets.bird);
    final birdUp=await gameRef.loadSprite(AppAssets.birdup);
    final birdDown=await gameRef.loadSprite(AppAssets.birddown);
    gameRef.bird;
    size=Vector2(40,45);
    position=Vector2(45, gameRef.size.y/2-size.y/2);
    current=BirdMove.mid;
    sprites={
      BirdMove.mid:birdMid,
      BirdMove.up:birdUp,
      BirdMove.down:birdDown
    };
    add(CircleHitbox());
  }
  @override
  void update(dt){
    super.update(dt);
    position.y+=Config.birdVelocity*dt;
  }

  fly(){
    add(MoveByEffect(Vector2(0,-Config.gravity),EffectController(duration: 0.2,curve: Curves.decelerate),
    onComplete: ()=>current=BirdMove.down));
    current=BirdMove.up;
  }

  @override
  onCollisionStart(Set<Vector2> intersectionPoints,PositionComponent other){
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  gameOver(){
    game.isCollid=true;
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
  }

  reset(){
    position=Vector2(45, gameRef.size.y/2-size.y/2);
  }
}