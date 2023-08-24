import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/utils/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const Stories({super.key,
  required this.currentUser,
  required this.stories,
  
  });

  @override
  Widget build(BuildContext context) {
  return Container(
  height: 200,
  color: Responsive.isDesktop(context)?  Colors.transparent:   Palette.white,
  child: ListView.builder(
  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
  scrollDirection: Axis.horizontal,
  itemCount: 1 + stories.length,
  itemBuilder: (context, index) {
    if(index==0){
      return _StoryCard(
    isAddStory: true,
    currentUser: currentUser
      );   
    }
    final Story story = stories[index-1];
    return Padding(padding: 
    const EdgeInsets.symmetric(horizontal: 4),
    child: _StoryCard(story:story),
    );
    
  },),

    );
  }
}
class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;
  const _StoryCard({super.key,
  this.isAddStory = false,
  this.currentUser,
  this.story,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            
           imageUrl: isAddStory? currentUser!.imageUrl : story!.imageUrl,
          height: double.infinity,
          width: 110,
          fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
          gradient: Palette.storyGradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: Responsive.isDesktop(context)?  [const BoxShadow(color: Colors.black26,offset: Offset(0, 2),blurRadius: 4)] : null

          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: isAddStory ?
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Palette.white,
              shape: BoxShape.circle
            ),
            child: IconButton(onPressed: (){
              print('Add to story');
            },
            icon: const Icon(Icons.add),
            iconSize: 30,
            color: Palette.facebookBlue,
            ),
          ) :
          ProfileAvatar(
            imageUrl: story!.user.imageUrl,
            hasBorder: story!.isViewed,
            ),
          ),
          Positioned(
          bottom: 8,
          left: 8,
          right: 8,  
          child: Text(
            isAddStory ? 'Add to story' : story!.user.name
          , style: const TextStyle(color: Palette.white, fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis ,
          
          )
          
          )

      ],
    );
  }
}
