import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FeedbackPageState();
  }
}
class _FeedbackPageState extends State<FeedbackPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top),
      color: Color.fromRGBO(241, 241, 241, 1),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.black),
                onTap: () {
                  Navigator.pop(context,'返回设置页');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200.0),
              ),
              new Text('用户反馈',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  height: 3,
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('用户反馈页面',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  height: 3,
                  decoration: TextDecoration.none,
                ),
              ),
              new Text('测试页面',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  height: 3,
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
        ],
      ),
    );    
  }
}