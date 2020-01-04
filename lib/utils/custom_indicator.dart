import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final double containerSize;
  final double progressSize;

  const CustomIndicator({
    Key key, this.containerSize, this.progressSize = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: progressSize,
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: Image.asset('assets/loading_img.gif'),
        ),
      ),
    );
  }
}