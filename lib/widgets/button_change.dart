import 'package:flutter/material.dart';

class ActionButtonIcon extends StatefulWidget {
  const ActionButtonIcon({Key? key}) : super(key: key);

  @override
  _ActionButtonIconState createState() => _ActionButtonIconState();
}

class _ActionButtonIconState extends State<ActionButtonIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<IconData> _iconAnimation;

  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _iconAnimation = TweenSequence<IconData>([
      TweenSequenceItem(
          tween: Tween<IconData>(
              begin: Icons.favorite_border, end: Icons.exposure_minus_1),
          weight: 50),
      TweenSequenceItem(
          tween: Tween<IconData>(
              begin: Icons.favorite, end: Icons.exposure_plus_1),
          weight: 50)
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Tap the button to see the animation:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
        backgroundColor: _colorAnimation.value,
        child: AnimatedBuilder(
          animation: _iconAnimation,
          builder: (context, child) {
            return Icon(_iconAnimation.value);
          },
        ),
      ),
    );
  }
}
