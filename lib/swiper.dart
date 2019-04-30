import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './rightBar.dart';
import './lrc.dart';
import './audiocoreplugin.dart';
import './comment.dart';
import 'package:audiocore_plugin/audiocore_plugin.dart';



class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  List arr = [];
  var  fileLink = [], 
        curIndex = 0, 
        _limit = 5,
        _offset = 0,
        verticalDirection = "";
  String lrcTxt = "";
  String curLrc = "";
  bool offstageLrc = false;
  List commentTemp = [];
  List<Comment> commentList = [];
  AudiocoreManager audiocore = AudiocoreManager.instance;  
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  bool isShowPlaybtn = false; //是否展示播放按钮

  @override
  void initState() {
    super.initState();
    // AudiocorePlugin.init();
    // AudiocorePlugin.initAudioCore();
    _getData();
    _scrollController.addListener(() {
      //
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  _getData() async {
    print("请求数据222");
    Dio dio = new Dio();
    var url1 = 'http://192.168.218.106:8001/yinfu/querypage?offset=$_offset&limit=$_limit';
    // print(url1);
    // var url = 'http://musicapi.taihe.com/v1/restserver/ting?method=ting.baidu.plaza.getFocusPic&from=qianqianmini&version=11.0.0&platform=win32&num=6';
    var url = 'http://musicapi.taihe.com/v1/restserver/ting?method=baidu.ting.billboard.billList&from=qianqianmini&version=11.2.4&platform=darwin&type=2&size=$_limit&offset=$_offset';
    Response response = await dio.get(url1);
    // Response response1 = await dio.post(url1);
    print(3333);
    // print(response.data['song_list'].length);
    if(_offset==0){
      _getSongLink(response.data[0]['songid'].toString());
      _getCommentList(response.data[0]['songid'].toString());
    }
    List add = response.data;
    if(response.data.length!=0){
      setState(() {
        _offset = _offset + _limit;
        arr.addAll(add);
      });
    }
    
  }
  // 选链
  _getSongLink(String songid) async {
    Dio dio = new Dio();
    var url = 'http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.getSongLink&songid=$songid';
    Response response = await dio.post(url);
    setState(() {
      String link = response.data['result']['songinfo']['lrclink'];
      _getSongLrc(link);
    });

    // fileLink = response.data['result']['bitrate'][0]['file_link'];
    // return response.data['result']['bitrate'];
    // AudiocorePlugin.playSong(response.data['result']['bitrate'][0]['file_link']);
    audiocore.playingSong(response.data['result']['bitrate'][0]['file_link']);

  }

  // 获取歌词内容
  _getSongLrc(link) async{
    setState(() {
      lrcTxt = "";
    });
    if (link.length > 0 ) {
      // if(link.indexOf("http:") > -1) {
      // 	link = link.replace("http","https");
      // }
      try {
        Response response = await Dio().get(link);
        setState(() {
          lrcTxt = response.toString();
        });
      } catch (e) {
        print('获取歌词内容报错');
        print(e);
      }
      
    } else {
        // this.lrc = 'no-lrcFile';
    }
  }

// 展示当前歌词
void onDataChange(val) {
  setState(() {
    curLrc = val;
  });
}

  // 获取评论列表
  _getCommentList(String songid) async {
    commentList.clear();
    print(commentList);
    try {
      var _commentUrl = 'http://tingapi.ting.baidu.com/v1/restserver/ting?qa=1&method=baidu.ting.ugcmsg.getCommentListByType&s_protocol=1&offset=0&size=20&type=2&type_id=$songid';
      Response response = await Dio().get(_commentUrl);
      commentTemp = response.data['result']['commentlist_last'];
      // lrcTxt = response.toString();
      commentTemp.forEach((elem)=>{
        commentList.add(Comment(elem['author']['userpic'], elem['author']['username'], elem['comment'], elem['zan_num'], false)):commentList
      });
      print('获取评论列表');
        
    } catch (e) {
      print('获取评论列表报错');
      print(e);
    }
  }


  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top),
        color: Colors.black,
        child: new Stack(
        
          children: <Widget>[
            ListView.builder(
              itemCount: arr.length,
              itemBuilder: (context, index) {
                return new GestureDetector(
                  // 竖直方向滑动
                  onVerticalDragUpdate: (details){
                    //dy>0，下滑，dy<0，上滑
                    var dy = details.delta.dy;
                    //下滑
                    if(dy>5){
                      if(index-1>=0){
                        _scrollController.animateTo( 
                          (index-1) * (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top), 
                          duration: new Duration(milliseconds: 500), 
                          curve: Curves.ease
                        );
                        verticalDirection = "down";
                      }
                    }
                    //上滑
                    if(dy<-5){
                      if(index+1<=arr.length-1){
                        _scrollController.animateTo( 
                          (index+1) * (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top), 
                          duration: new Duration(milliseconds: 500), 
                          curve: Curves.ease
                        );
                        verticalDirection = "up";
                      }
                      
                    }
                  },
                  // 竖直方向滑动结束
                  onVerticalDragEnd: (endDetails){
                    print("方向是$verticalDirection");
                    if(verticalDirection!=""){
                      if(verticalDirection=="down"){
                        curIndex = curIndex>0?curIndex-1:0;
                      }else if(verticalDirection=="up"){
                        curIndex = curIndex+1<arr.length-1?curIndex+1:arr.length-1;
                        if(curIndex >= arr.length-2){
                          print('请求新数据');
                          _getData();
                        }
                      }
                      verticalDirection="";
                      _getSongLink(arr[curIndex]['songid'].toString());
                      _getCommentList(arr[curIndex]['songid'].toString());
                      setState(() {
                        isShowPlaybtn = false;
                      });
                    }else {
                      if(isShowPlaybtn == false) {
                        audiocore.pause();
                        setState(() {
                          isShowPlaybtn = true;
                        });
                      }else {
                        audiocore.play();
                        setState(() {
                          isShowPlaybtn = false;
                        });
                      }
                    }
                  },
                  
                  child: new Stack(
                    //index curIndex
                    children: <Widget>[
                      new Image.network(
                        arr[index]['gifUrl'],
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top),
                        fit: BoxFit.fill),
                      new Positioned(
                        left: 0,
                        top: 0,
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top),
                        child: new Container(
                          color: Color.fromRGBO(2,2,49,0.5),
                        ),
                      ),
                      new Positioned(
                        left: 0,
                        top: 0,
                        child: (curIndex == index &&isShowPlaybtn) ? new Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: new Center(
                              child: new Container(
                                width: 45,
                                height: 54,
                                child: new Image.asset('images/stop.png'),
                              )
                            ),
                        ) : new Text(""),
                      ),
                      new Positioned(
                        left: 0,
                        top: 0,
                        child: (curIndex == index && lrcTxt.length > 0) ? new LrcWidget(lrcTxt:lrcTxt, callback: (val) => onDataChange(val)) : new Text("")
                      ),
                      new Positioned(
                        left: 0,
                        top: 100.0,
                        child: (commentList.length > 0) ? new DanmuList(commentList) : new Container(child: null,),
                      ),
                      new Positioned(
                        left: 0,
                        top: 100.0,
                        child: new MyDanmuItem(),
                      ),
                      new Positioned(
                        right: 5.0,
                        top: 256.0,
                        child: new RightBarWidget(commentList)
                      ),
                      new Positioned(
                        left: 12.0,
                        bottom: 98.0,
                        child: new Row(
                          crossAxisAlignment:CrossAxisAlignment.start, // 上对齐
                          children: <Widget>[
                            new Container(
                              color: Color(0xFF242233),
                              margin: new EdgeInsets.only(right: 4.0),
                              // padding: new EdgeInsets.all(4.0),
                              padding: new EdgeInsets.fromLTRB(7, 9, 8, 11),
                              width: 30.0,
                              child: new Text(
                                arr[index]['title'],
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  // background: Color(0xFF000000),
                                  color: Color(0xFFFCECCD),
                                  decoration: TextDecoration.none
                                ),
                              ),
                            ),
                            new Container(
                              color: Color(0xFF242233),
                              // padding: new EdgeInsets.all(4.0),
                              padding: new EdgeInsets.fromLTRB(8, 9, 7, 11),
                              width: 30.0,
                              child: new Text(
                                arr[index]['author'],
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w200,
                                  color: Color(0xFF9999ff),
                                  // height: 1.2,
                                  decoration: TextDecoration.none
                                ),
                              ),
                            ),
                            
                          ],
                        )
                      )
                    ],
                  )
                );
              },
              controller: _scrollController,
              itemExtent: (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top),
              // itemExtent: MediaQuery.of(context).size.height,
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              physics: const NeverScrollableScrollPhysics(), //禁止滚动
              // addAutomaticKeepAlives: true,        //自动保存视图缓存?
            ),
            // // 用户头像
            new Positioned(
              left: 12.0,
              top: 32.0,
              child: new GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/login');
                },
                child: new CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://qukufile2.qianqian.com/data2/pic/140d09665d1c204efe00973c3e16282c/612757841/612757841.jpg@s_1,w_166,h_166'
                  ),
                  radius: 30.0,
                ),
              )
              
            ),
          ]
        )
      ),
    );
  }
}