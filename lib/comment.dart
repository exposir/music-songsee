import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Comment {
  final String userPic;
  final String userName;
  final String content;
  final int amount;
  final bool isFavourite;
  Comment(this.userPic,this.userName,this.content,this.amount,this.isFavourite);
}

class CommentItem extends StatefulWidget {
  
  final List<Comment> comments;

  CommentItem(this.comments);
  
  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.comments.length,
        itemBuilder: (context,index) {
          return Container(
            height: 72.5,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 36.0,
                    height: 36.0,
                    margin: EdgeInsets.fromLTRB(22.0, 10.0, 17.0, 12.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.comments[index].userPic),
                      radius: 100.0,
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width - 120.0,
                                    margin: EdgeInsets.fromLTRB(0, 12, 0, 6),
                                    child: Text(
                                      '${this.widget.comments[index].userName}',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(153, 153, 153, 1)
                                      ),
                                      textDirection: TextDirection.ltr,
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 120.0,
                                    margin: EdgeInsets.all(0.0),
                                    child: Text(
                                      '${this.widget.comments[index].content}',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color.fromRGBO(64, 81, 98, 1)
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 30.0,
                              height: 72.0,
                              margin: EdgeInsets.only(right: 10.0),
                              child: Column(
                                children: <Widget>[
                            
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    margin: EdgeInsets.fromLTRB(0, 13.0, 0, 0),
                                    child: Image.asset('images/icon_zan_normal.png'),
                                  ),
                                  Container(
                                    width: 30.0,
                                    child: Center(
                                      child: Text('${this.widget.comments[index].amount}',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(153, 153, 153, 1)
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 0.5,
                          width: MediaQuery.of(context).size.width - 75,
                          // margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          color: Color.fromRGBO(216, 216, 216, 1),
                        )
                        
                      ],
                    )
                  ),
                ],
              ),
            )
          );
        },
      ),
    );
  }
}

List<Comment> myList = [
  Comment('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4160285545,785331896&fm=26&gp=0.jpg', '顾清弦', '人生若只如初见，何事秋风悲画扇。', 932, true),
  Comment('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551953386094&di=438a9851adfb0d6e6748b6eb01fef08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201804%2F02%2F20180402123540_pcagg.jpeg', '方青黛', '寂寞空庭春欲晚，梨花满地不开门。', 673, false),
  Comment('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551953386093&di=b164f81b6f569cdc9eeb28c8937b4b7e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201710%2F17%2F20171017050014_HrSYm.jpeg', '雪嫣然', '还君明珠双泪垂，恨不相逢未嫁时。', 412, false),
  Comment('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551953386091&di=0d52ebe2af1d0f265753543a048e30df&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201808%2F09%2F20180809023010_hujcn.jpeg', '苏筱沐', '草铺横野六七里，笛弄晚风三四声。', 182, false),
  Comment('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551953386090&di=3695235792da143320c36a58bb19e34c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201802%2F13%2F20180213133858_vlbof.jpg', '洛雪玥', '竹喧归浣女，莲动下渔舟。', 76, false),
];

class CommentList extends StatefulWidget {
  final List<Comment> comments;
  CommentList(this.comments);

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  
  TextEditingController inputController = TextEditingController();

  void _addList(value) {
    if(value.length > 0){
      setState(() {
        myDamu =Comment('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2855330769,2577900067&fm=26&gp=0.jpg', '百里玄策', value, 0, false);
        this.widget.comments.add(Comment('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2855330769,2577900067&fm=26&gp=0.jpg', '百里玄策', value, 0, false));
      });
    }
    inputController.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * 1.36,
          width: MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg_pinglun.png'),
              fit: BoxFit.fitWidth
            ),
          ),
          // color: ,
          child: Column(
            children: <Widget>[
              Container(
                height: 63.0,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 22.0,
                      left: 22.0,
                      child: Text('评论(${this.widget.comments.length})',
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10.0,
                      top: 14.0,
                      child: Container(
                        child: CloseButton()
                      )
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 1.36 - 123.0,
                child: CommentItem(this.widget.comments)
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            child: Container(
              margin: EdgeInsets.all(12.0),
              child: TextField(
                controller: inputController,
                decoration:InputDecoration(
                  labelText:'听我一言',
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(15.0)
                    // borderSide: Color.fromRGBO(, g, b, opacity)
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                ),
                onSubmitted: (text) {
                  _addList('$text');
                }
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DanmuItem extends StatefulWidget {

  final List<Comment> comments;

  final int columnNum;
  
  DanmuItem(this.comments,this.columnNum);
  
  @override
  _DanmuItemState createState() => _DanmuItemState();
}

class _DanmuItemState extends State<DanmuItem> {

  Comment _danmuItem =Comment('', '', '', 0, false);

  double _left = 400;

  final _random = new Random();

  int _count;
  
  Timer _timer;

  _startTimer() {
    int _duration = _random.nextInt(1)*5 + 10;

    double _position = _random.nextDouble() * 800 + 400;
    _left = _position;
    
    _timer = new Timer.periodic(new Duration(milliseconds: _duration), (timer) {
      if(_danmuItem.userPic.length != 0) {
        if(_left<-430) {
          if(_count < widget.comments.length){
            setState(() {
              _danmuItem = widget.comments[_count];
              _count += 4;
            });
          } else {
             _danmuItem = Comment('', '', '', 0, false);     
          }
          _left = 450;
        } else {
          setState(() {
            _left -= 1;
          });          
        }
      }
    });
  }

  _cancelTimer() {
    print('弹幕关闭');
    _timer?.cancel();
  }

  initState() {
    _danmuItem = widget.comments[widget.columnNum];
    _count = widget.columnNum + 4;
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(bottom: 6.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 36.0,
          ),
          Positioned(
            left: _left,
            top: 0,
            child: Material(
              color: Color.fromRGBO(0, 0, 0, 0.6),
              borderRadius: BorderRadius.circular(18.0),
              // color: Colors.yellow,
              child: Container(
                height: 36.0,
                // width: 36.0,
                padding: EdgeInsets.fromLTRB(9, 4, 11, 4),
                // margin: EdgeInsets.fromLTRB(35, 4, 11, 4),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 28.0,
                      height: 28.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(_danmuItem.userPic),
                        radius: 100.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.0),
                      child: Text(
                        '${_danmuItem.content}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  dispose() {
    super.dispose();
    _cancelTimer();
  }
}

class DanmuList extends StatefulWidget {
  final List<Comment> comments;
  DanmuList(this.comments);
  @override
  _DanmuListState createState() => _DanmuListState();
}

class _DanmuListState extends State<DanmuList> {
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          DanmuItem(widget.comments,0),
          DanmuItem(widget.comments,1),
          DanmuItem(widget.comments,2),
          DanmuItem(widget.comments,3)
        ],
      ),
    );
  }
}

Comment myDamu =Comment('', '', '', 0, false);

class MyDanmuItem extends StatefulWidget {
  @override
  _MyDanmuItemState createState() => _MyDanmuItemState();
}

class _MyDanmuItemState extends State<MyDanmuItem> {

  double _left = 450;
  
  Timer _timer;

  _startTimer() {
    
    _timer = new Timer.periodic(new Duration(milliseconds: 5), (timer) {
      if(myDamu.userPic.length != 0) {
        if(_left<-420) {
          setState(() {
            myDamu = Comment('', '', '', 0, false);
            _left = 450;
          });
        } else {
          setState(() {
            _left -= 1;
          });
        }
      }
    });
  }

  _cancelTimer() {
    _timer?.cancel();
  }

  initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 6.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 36.0,
          ),
          Positioned(
            left: _left,
            top: 0,
            child: Material(
              color: Color.fromRGBO(0, 0, 0, 0.6),
              borderRadius: BorderRadius.circular(18.0),
              child: Container(
                height: 36.0,
                padding: EdgeInsets.fromLTRB(9, 4, 11, 4),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 28.0,
                      height: 28.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(myDamu.userPic),
                        radius: 100.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.0),
                      child: Text(
                        '${myDamu.content}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  dispose() {
    super.dispose();
    _cancelTimer();
  }
}