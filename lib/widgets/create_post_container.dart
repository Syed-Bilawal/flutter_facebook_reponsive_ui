import 'package:facebook/utils/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/utils/app_String.dart';
import 'package:facebook/widgets/Elevated_Button.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({super.key,
  required this.currentUser
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop? 5:0),
      elevation: isDesktop? 1:0,
      shape:
       isDesktop? RoundedRectangleBorder
       (borderRadius: BorderRadius.circular(10)) 
      : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          12, 8, 12, 0),
      color: Palette.white,
      child: Column(
      children: [
        Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl),
            SizedBox(width: 8,),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: AppStrings.htext)
                ,
              ),
            )
          ],
        ),
        Divider( height: 10, thickness: 0.5,),
        Container( height: 40,
          child: Row(children: [
          CustomButton(
            color: Palette.red,
            icon: Icons.videocam, 
            lable: 'Live', 
            onPressed: (){ print('live');}),
            SizedBox(width: 50,),
            CustomButton(
              color: Palette.green,
            icon: Icons.photo_library, 
            lable: 'Photo', 
            onPressed: (){ print('photo');}),
            SizedBox(width: 50,),
            CustomButton(
            color: Palette.purpleAccent,
            icon: Icons.video_call, 
            lable: 'Room', 
            onPressed: (){ print('Room');}),
        
          ],),
        )
      ],
      ),
    
      ),
    );
  }
}