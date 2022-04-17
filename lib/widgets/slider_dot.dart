import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {

  bool isActived;
  SliderDot(this.isActived);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 15),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: isActived ? 12 : 6,
      height: 5,
      decoration: BoxDecoration(
        color: isActived ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }
}