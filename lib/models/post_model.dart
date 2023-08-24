// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook/models/models.dart';

class Post {
final User user;
final String caption;
final String timeAgo;
late final String imageUrl;
final int likes;
final int comments;
final int shares;
  Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });


}