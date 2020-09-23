import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationControllar;
  Animation animation;

  // void myListener(status) {
  //   if (status == AnimationStatus.completed) {
  //     animation.removeStatusListener(myListener);
  //     _animationControllar.reset();
  //     animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
  //         parent: _animationControllar, curve: Curves.fastOutSlowIn));
  //     _animationControllar.forward();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _animationControllar = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationControllar, curve: Curves.fastOutSlowIn));
    // ..addStatusListener(myListener);
    _animationControllar.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
      ),
      body: AnimatedBuilder(
        animation: _animationControllar,
        builder: (context, child) => Transform(
          transform:
              Matrix4.translationValues(animation.value * width, 0.0, 0.0),
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
