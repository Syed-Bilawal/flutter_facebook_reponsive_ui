import 'package:facebook/utils/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({super.key,
  required this.onlineUsers,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Card(
       margin: EdgeInsets.symmetric(horizontal: isDesktop? 5:0),
      elevation: isDesktop? 1:0,
      shape:
       isDesktop? RoundedRectangleBorder
       (borderRadius: BorderRadius.circular(10)) 
      : null,
      child: Container(
        height: 60,
        color: Palette.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10 , horizontal: 4
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index) {
            if(index == 0){
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: _CreatRoomButton(),
                );
            }
            final User user = onlineUsers[index-1]; 
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(imageUrl: user.imageUrl,
              isActive: true,
              ),
            );
            
          },
          
          
          ),
    
      ),
    );
  }
}


class _CreatRoomButton extends StatelessWidget {
  const _CreatRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
      style: ButtonStyle(shape: 
      MaterialStatePropertyAll( 
      RoundedRectangleBorder( 
      side: const BorderSide(width: 3 , color: Colors.blueAccent ),
      borderRadius: BorderRadius.circular(30)
      ),
      )
      ),
      
      child: Row(children: [
        ShaderMask(
          shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
          child: const Icon(Icons.video_call,
          size:  33,
          color: Colors.white,),
        ),
        const SizedBox(width: 4,),
        const Text('Create\nRoom')
      ]),

    );
  }
}