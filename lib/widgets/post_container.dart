import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/utils/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({super.key,
  required this.post
  
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Card(
         margin: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: isDesktop? 5:0),
      elevation: isDesktop? 1:0,
      shape:
       isDesktop? RoundedRectangleBorder
       (borderRadius: BorderRadius.circular(10)) 
      : null,
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Palette.white,
      child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _PostHeader(post:post),
              const SizedBox(height: 4,),
              Text(post.caption),
              post.imageUrl != null ?
              const SizedBox.shrink()
              :const SizedBox(height: 0,) 
        
          ],),
        ),
        // ignore: unnecessary_null_comparison
        post.imageUrl != null ?
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CachedNetworkImage(imageUrl: post.imageUrl),
        ):
         const SizedBox.shrink(),
        Padding(padding: 
        const EdgeInsets.symmetric(horizontal: 8),
        child: _PostStat(post:post),
        
        )
      ],
      ),
    
      ),
    );
  }
  
}

class _PostHeader extends StatelessWidget {
 final Post post;
  const _PostHeader({super.key,
  required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
    ProfileAvatar(
    imageUrl: post.user.imageUrl),
    const SizedBox(width: 8,),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(post.user.name, style: const TextStyle(fontWeight: FontWeight.bold),),
        Row(
          children: [
            Text('${post.timeAgo} +' ,
            style: const TextStyle(
              color: Palette.grey600,
              fontSize: 12
            ),),
            const Icon(Icons.public,
            color: Palette.grey600,
            size: 12,
            )
          ],
        )
      ],
      ),
    ),
    IconButton(onPressed:(){
      print('more');
    } 
    , icon: const Icon(Icons.more_horiz))

],

    );
  }
}

class _PostStat extends StatelessWidget {
 final Post post;
  const _PostStat({super.key,
  required this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
            color: Palette.facebookBlue,
            shape: BoxShape.circle

          ),
          child: const Icon(Icons.thumb_up,
          size: 18.0,
          color: Colors.white,
          ),
          ),
          const SizedBox(width: 4,),
          Expanded(
            child: Text('${post.likes}',
            style: TextStyle(
              color: Colors.grey[600],
            ),
            ),
          ),
          const SizedBox(width: 8,),
          Text('${post.comments} comments',
          style: TextStyle(
            color: Colors.grey[600],
          ),
          ),
          const SizedBox(width: 8,),
          Text('${post.likes} shares'  ,
          style: TextStyle(
            color: Colors.grey[600],
          ),
          ),
        ],),
        const Divider(),
        Row(
          children: [
             _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => print('Comment'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap: () => print('Share'),
            )

             
          ],
        )

      ],
    );
  }
}


class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final void Function()? onTap;

  const _PostButton({super.key,
  required this.icon,
  required this.label,
  required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}