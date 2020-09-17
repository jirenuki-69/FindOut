import 'package:findout/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SnakeButton extends StatefulWidget {
  SnakeButton({
    Key key,
    @required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.snakeColor = Colors.purple,
    this.borderColor = Colors.white,
    this.borderWidth = 6.0,
    @required this.onTap,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Color snakeColor;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback onTap;

  @override
  _SnakeButtonState createState() => _SnakeButtonState();
}

class _SnakeButtonState extends State<SnakeButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      splashColor: primaryColor,
      child: CustomPaint(
        painter: _SnakePainter(
          animation: _controller,
          borderWidth: widget.borderWidth,
          borderColor: widget.borderColor,
          snakeColor: widget.snakeColor,
        ),
        child: Container(
          child: widget.child,
        ),
      ),
    );
  }
}

class _SnakePainter extends CustomPainter {
  _SnakePainter({
    @required this.animation,
    this.snakeColor,
    this.borderColor,
    this.borderWidth,
  }) : super(repaint: animation);

  final Animation animation;
  final Color snakeColor;
  final Color borderColor;
  final double borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Paint paint = Paint()
      ..shader = SweepGradient(
        colors: <Color>[
          snakeColor,
          Colors.transparent,
        ],
        stops: [0.7, 1.0],
        startAngle: 0.0,
        endAngle: vector.radians(80),
        transform: GradientRotation(vector.radians(360 * animation.value)),
      ).createShader(rect);

    Path path = Path.combine(
      PathOperation.xor,
      Path()..addRect(rect),
      Path()..addRect(
          rect.deflate(borderWidth),
      ),
    );

    canvas.drawRect(
      rect.deflate(borderWidth / 2),
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
