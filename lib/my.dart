import 'package:flutter/material.dart';
import './feedback.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height +
          MediaQuery.of(context).padding.top),
      color: Color.fromRGBO(243, 238, 234, 1),
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.network(
                      "http://thyrsi.com/t6/677/1551945379x2890191841.png",
                      width: 40,
                    ),
                    onTap: () {
                      Navigator.pop(context, 'MyPage');
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 270.0),
              ),
              new Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.network(
                      "http://thyrsi.com/t6/677/1551945572x2890173891.png",
                      width: 40,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new FeedbackPage();
                        // return new NewRoute();
                      }));
                    },
                  ),
                ],
              )
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "http://thyrsi.com/t6/677/1551943026x1822611209.png",
                width: 110,
              )
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                '眉间朱砂扰红尘',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  fontSize: 15.0,
                  height: 1.5,
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "http://thyrsi.com/t6/677/1551941837x2728279033.png",
                width: 160,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
              ),
              Image.network(
                "http://thyrsi.com/t6/677/1551941880x2728279033.png",
                width: 160,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "http://thyrsi.com/t6/677/1551941901x2728279033.png",
                width: 160,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
              ),
              Image.network(
                "",
                width: 160,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new rout1e"),
      ),
    );
  }
}
