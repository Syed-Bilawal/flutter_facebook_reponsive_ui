import 'package:facebook/utils/palette.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
final IconData icon;
final double iconSize;
final void Function() onPressed;

  const CircleButton({
    super.key, 
    required this.icon, 
    required this.iconSize, 
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
         margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
           color: Palette.grey200,
         shape: BoxShape.circle
       ),
      child: IconButton(
        onPressed: onPressed,
       icon: Icon(icon),
        iconSize: iconSize,
        color: Palette.black,),
                 
        );
  }
}