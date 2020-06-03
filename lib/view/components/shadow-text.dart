import 'dart:ui';
import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  ShadowText(this.data, {this.style}) : assert(data != null);

  final String data;
  final TextStyle style;

  Widget build(BuildContext context) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 1.5,
            left: 1.5,
            child: new Text(
              data,
              style: style.copyWith(color: Colors.black.withOpacity(0.75)),
            ),
          ),
          new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
            child: new Text(data, style: style),
          ),
        ],
      ),
    );
  }
}
