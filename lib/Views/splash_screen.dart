import 'dart:async';

import 'package:crona_virus/Views/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(

      duration:const Duration( seconds: 3),
      vsync: this)..repeat();
  @override

  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>const WorldStatesScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation:_controller ,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image(
                      image: AssetImage("assets/virus.png"),
                    ),
                  ),
                ),
                builder: (BuildContext context , Widget? child){
                  return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }
            ),

            SizedBox(
              height: size.height * 0.08,
            ),
           const Align(
              alignment: Alignment.center,
              child: Text("Covid-19\nTracker App" , textAlign: TextAlign.center , style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ) ,),
            )
          ],
        ),
      ),
    );
  }
}
