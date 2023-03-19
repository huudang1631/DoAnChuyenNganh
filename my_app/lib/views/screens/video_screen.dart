import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/controllers/taikhoan_controller.dart';
import 'package:my_app/controllers/video_controller.dart';
import 'package:my_app/views/screens/binhluan_screen.dart';
import 'package:my_app/views/screens/timkiem_screen.dart';
import 'package:my_app/views/screens/trangchu.dart';
import 'package:my_app/views/widgets/video_player_item.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

import '../widgets/animation.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final VideoController videoController = Get.put(VideoController());

  bool _isFollowingSelected = true;
 
  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Container(
          
          child: Container(
            width: 50,
            height: 50,
                 
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
        ),
         Positioned(  
          bottom: 2,
          left: 15,
          child: Container(
              decoration: BoxDecoration(color: Colors.red ,borderRadius: BorderRadius.circular(25) ),
              child: Icon(
                Icons.add,
                size: 20,
                ),
            )
          )
      ]),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              )
            ),
           
        ],

      ),
    );
  }
  
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,             
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.end,   
                 
          children: [           
            Positioned(          
          child: Container(         
              child: Icon(
                Icons.live_tv,
                size: 25,
                ),
            )
          ),
          SizedBox(
            width: 45,
          ),
            GestureDetector(
              onTap: () => {
                setState(()
                {
                  _isFollowingSelected = true;
                
                  
                })
              } ,             
              child: Text(
                'Đang Follow',
                style: Theme.of(context)             
                .textTheme
                .bodyText1!
                .copyWith(
                  fontSize:_isFollowingSelected ?  20 : 18 ,
                  color: _isFollowingSelected ? Colors.white: Colors.grey[400]),
                
                ),
            ),
            Text('  |  ',
            style: Theme.of(context)             
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 18,color: Colors.grey[400]),
              ),
            GestureDetector(
              onTap: () => {
                setState(()
                {
                  _isFollowingSelected = false;
                })
              } ,
              child: Text('Dành cho bạn',
              style: Theme.of(context)             
                .textTheme
                .bodyText1!
                .copyWith(
                  fontSize:!_isFollowingSelected ?  20 : 18 ,
                  color: !_isFollowingSelected ? Colors.white: Colors.grey[400],
                  ),                   
            ),
            ),
          ]
        ),
     
      ),




      
      body: Obx(() {
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(
                  videoUrl: data.videoUrl,
                  
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height:5,
                                  ),
                                  Text(
                                    '@${data.username}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height:5,
                                  ),
                                  Text(
                                    data.caption,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height:5,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        CupertinoIcons.music_note_2,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      
                                      Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text(
                                          ' ${data.songName}',                                                                                                                                                         
                                          style: const TextStyle(
                                            fontSize: 15,                                          
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: size.height / 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildProfile(
                                  data.profilePhoto,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          videoController.likeVideo(data.id),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 40,
                                        color: data.likes.contains(
                                                taikhoanController.user.uid)
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.likes.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CommentScreen(
                                            id: data.id,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.comment,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.commentCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.reply,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.shareCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                CircleAnimation(
                                  child: buildMusicAlbum(data.profilePhoto),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }),
    );
  }
}