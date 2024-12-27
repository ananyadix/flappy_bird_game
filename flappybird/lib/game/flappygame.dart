import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird/component/background.dart';
import 'package:flappybird/component/ground.dart';
import 'package:flappybird/component/bird.dart';
import 'package:flappybird/component/pipegroup.dart';
import 'package:flappybird/game/config.dart';

class FlappyGame extends FlameGame with TapDetector, HasCollisionDetection{
  FlappyGame();
  late Bird bird;
  Timer interval=Timer(Config.pipeInterval,repeat: true);
  bool isCollid=false;
  @override
  Future<void> onLoad() async{
    addAll([
      Background(),
      Ground(),
      bird=Bird(),
    ]);
    interval.onTick=() =>add(PipeGroup());
  }
  @override
  void update(double dt){
    super.update(dt);
    interval.update(dt);
  }

  @override
  void onTap(){
    super.onTap();
    bird.fly();
}
}