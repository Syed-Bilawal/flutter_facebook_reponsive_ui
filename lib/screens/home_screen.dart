import 'package:facebook/utils/palette.dart';
import 'package:facebook/data/data.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widgets/circle_button.dart';
import 'package:facebook/widgets/contact_list.dart';
import 'package:facebook/widgets/create_post_container.dart';
import 'package:facebook/widgets/more_options.dart';
import 'package:facebook/widgets/post_container.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/rooms.dart';
import '../widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final TrackingScrollController _trackingScrollController = TrackingScrollController();
 @override
  void dispose() {
    _trackingScrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:_HomeScreenMobile( scrollController: _trackingScrollController), 
          desktop: _HomeScreenDesktop(scrollController: _trackingScrollController),
          tablet: const _HomeScreenTab(),
         
        ),
      ),
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenDesktop({super.key,
  required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible( flex: 2,
          child:  Align(alignment: Alignment.centerLeft,
            child: Padding(padding: 
            const EdgeInsets.all(12),
            child: MoreOptionsList(currentUser: currentUser),
            
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
          slivers: [
             SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              sliver: SliverToBoxAdapter(child: 
              Stories(currentUser : currentUser,
              stories :stories,
              )
              
              ,),
            ),
            SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser)
              ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              sliver: SliverToBoxAdapter(child: Rooms(
                onlineUsers: onlineUsers
              ),),
            ),
           
            SliverList(
              delegate: SliverChildBuilderDelegate((
                context, index){
                  final Post post = posts[index];
                  return PostContainer(post:post);
                },
                childCount: posts.length,
                
                
                ))  
          ],
        ),
        ),
        const Spacer(),
        Flexible( flex: 2,
          child: Align(alignment: Alignment.centerRight,
            child: Padding(padding: 
            const EdgeInsets.all(12),
            child: ContactsList(users: onlineUsers),
            
            ),
          ),
          
        )
      ],
    );
  }
}

class _HomeScreenTab extends StatelessWidget {
  const _HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}









  class _HomeScreenMobile extends StatelessWidget {
    final TrackingScrollController scrollController;
    const _HomeScreenMobile({super.key,
    required this.scrollController});
  
    @override
    Widget build(BuildContext context) {
      return CustomScrollView(
        controller:scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor:  Palette.white,
              title:  const Text('facebook', 
              style:  TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,fontWeight: FontWeight.bold
                , letterSpacing: -1.2),
                ),
              centerTitle: false,
              floating: true,
              actions: [
                CircleButton(icon: Icons.search,
                 iconSize: 30.0, 
                 onPressed: (){
                  print('Search');
                 }),
                 CircleButton(
                  icon: MdiIcons.facebookMessenger,
                 iconSize: 30.0, 
                 onPressed: (){
                  print('Messenger');
                 }),
              ],
            ),
            
            SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser)
              ),
          
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              sliver: SliverToBoxAdapter(child: Rooms(
                onlineUsers: onlineUsers
              ),),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              sliver: SliverToBoxAdapter(child: 
              Stories(currentUser : currentUser,
              stories :stories,
              )
              
              ,),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((
                context, index){
                  final Post post = posts[index];
                  return PostContainer(post:post);
                },
                childCount: posts.length,
                
                
                ))  
          ],
        );
    }
  }