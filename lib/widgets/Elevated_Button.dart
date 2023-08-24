import 'package:facebook/utils/palette.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
final IconData icon;
final String lable;
final void Function() onPressed;
final Color color;
final double? iconSize;
  const CustomButton({
    super.key,
    this.iconSize, 
    required this.color,
    required this.icon, 
    required this.lable, 
    required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton( 
      onPressed: onPressed,
      child: Row(
        children: [
        Icon(icon , color: color,
         size: iconSize,),
        const SizedBox(width: 10,),    
        Text(lable)
        ],
      ),  
      style: 
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(Palette.white),
        elevation: MaterialStatePropertyAll(0)), 
    );
  }
}