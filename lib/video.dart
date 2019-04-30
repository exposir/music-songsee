import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _VideoPageState();
  }
}

class _VideoPageState extends State<VideoPage> {
  // VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.network(
    //     'https://qukufile2.qianqian.com/data2/video/f307bf44fee9bdef742dbcee6708b191/612497029/612497029.mp4?0.06462488478029949')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }
  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }
  ScrollController _scrollController = new ScrollController();
  var verticalDirection = "", curIndex = 0;

  List<String> videoUrl = [
    'https://qukufile2.qianqian.com/data2/video/f307bf44fee9bdef742dbcee6708b191/612497029/612497029.mp4?0.06462488478029949',
    'https://qukufile2.qianqian.com/data2/video/da552fc8de0a5fe57c4298ffd5740b0c/612404944/612404944.mp4?0.7945995838442723',
    'https://qukufile2.qianqian.com/data2/video/941c86e47996e4a3017e6c9bb6544f1f/612118873/612118873.mp4?0.6862720985740973',
    'https://qukufile2.qianqian.com/data2/video/80b0eeea8ebdc54280f4d40e41c05027/612391156/612391156.mp4?0.8155443505193187',
    'https://qukufile2.qianqian.com/data2/video/740adaaaeadb9a818e0c1bfd47dcf1f3/612356124/612356124.mp4?0.8976518647553864',
    'https://qukufile2.qianqian.com/data2/video/d0a5d3af4ac02303095a657e600dd5af/612363743/612363743.mp4?0.5236788414625617',
  ];
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: videoUrl.length,
          itemBuilder: (context, index) {
            return new GestureDetector(
              // 竖直方向滑动
              onVerticalDragUpdate: (details){
                //dy>0，下滑，dy<0，上滑
                var dy = details.delta.dy;
                //下滑
                if(dy>5){
                  // _scrollController.animateTo( (index-1) * (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top), duration: new Duration(seconds: 1), curve: Curves.ease);
                  verticalDirection = "down";
                }
                //上滑
                if(dy<-5){
                  // _scrollController.animateTo( (index+1) * (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top), duration: new Duration(seconds: 1), curve: Curves.ease);
                  verticalDirection = "up";

                }
              },
              // 竖直方向滑动结束
              onVerticalDragEnd: (endDetails){
                print(verticalDirection);
                if(verticalDirection=="down"){
                  setState(() {
                    curIndex = curIndex>=0?curIndex-1:0;
                  });
                  
                  _scrollController.animateTo( (index-1) * (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top), duration: new Duration(seconds: 1), curve: Curves.ease);

                }else{
                  setState(() {
                    curIndex = curIndex+1;
                  });
                  // curIndex = curIndex+1;
                  _scrollController.animateTo( (index+1) * (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top), duration: new Duration(seconds: 1), curve: Curves.ease);

                }
                // _getSongLink(arr[curIndex]['song_id']);
                // print("得到的选链：$fileLink");
                print(curIndex);


              },
              child: new Text("$index $curIndex"),
            );
          },
          controller: _scrollController,
          itemExtent: (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top),
          padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          physics: const NeverScrollableScrollPhysics(), //禁止滚动

        ),
      ],
    );
    // return new Stack(
    //   children: <Widget>[
    //     Scaffold(
    //       backgroundColor: Colors.black,
    //       body:GestureDetector(
    //         onTap: (){
    //           setState(() {
    //             // _controller.
    //             _controller.value.isPlaying
    //                 ? _controller.pause()
    //                 : _controller.play();
    //           });
    //         },
    //         child: Center(
    //           child: _controller.value.initialized
    //             ? AspectRatio(
    //                 aspectRatio: _controller.value.aspectRatio,
    //                 child: VideoPlayer(_controller),
    //               )
    //             : Container(),
    //         ),
    //       ),
    //     ),
    //     new Positioned(
    //       left: 1.0,
    //       right: 1.0,
    //       bottom: 30.0,
    //       child: new bottomBarWidget()
    //     ),
    //   ],
    // );
  }
}