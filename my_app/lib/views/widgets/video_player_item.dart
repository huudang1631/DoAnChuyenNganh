import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerItem({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);
 

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;
  bool isVideoPlaying = true;
  @override
  void initState() {
    super.initState();
     
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
       
        videoPlayerController.play();
        videoPlayerController.setLooping(true);
        videoPlayerController.setVolume(1);
      });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
  void playpauseVideo() {
    isVideoPlaying 
              ? videoPlayerController.pause()
              : videoPlayerController.play();
              // setState((){
              //   isVideoPlaying  != isVideoPlaying;
              // });
  }
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: FutureBuilder(    
        builder: (context, snapshot ){
   
        return GestureDetector(
          onTap: () => {
            playpauseVideo()
          },

          child: Stack(
            alignment: Alignment.center,
            children: [
              VideoPlayer(videoPlayerController),
              IconButton(
                
                onPressed: () => {videoPlayerController.play()},
                icon: Icon(Icons.play_arrow,
                  color: Colors.white.withOpacity(isVideoPlaying ? 0 : 0.5),size: 100,)
                ),
            ],
          ),
        );
      }),
      
    );
  }
}