import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/game/config.dart';
import 'package:flappybird/game/flappygame.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/game/pipepos.dart';
import 'package:flappybird/component/pipe.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyGame>{
  PipeGroup();
  final random=Random();

  @override
  Future<void> onLoad() async{
    position.x=gameRef.size.x;
    final heightminusGround=gameRef.size.y-Config.groundHeight;
    final spacing=100+random.nextDouble()*(heightminusGround)/4;
    final centreY=spacing+random.nextDouble()*(heightminusGround-spacing);

    addAll([
      Pipe(pipePosition:PipePost.up,height:centreY-spacing/2),
      Pipe(pipePosition: PipePost.down,height: heightminusGround-(centreY+spacing/2))
    ]);
  }
  @override
  void update(double dt){
    super.update(dt);
    position.x-=Config.gameSpeed*dt;
    if(position.x<=-10){
      removeFromParent();
    }
  }
}