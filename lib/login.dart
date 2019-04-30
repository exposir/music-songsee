import 'package:flutter/material.dart';
import './feedback.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
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
              padding: const EdgeInsets.only(bottom: 30.0),
            ),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                ),
                GestureDetector(
                  child: new Text(
                    '取消',
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(187, 108, 81, 0.6),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, 'MyPage');
                  },
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                    ),
                    new Text(
                      '音',
                      style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        color: Color.fromRGBO(187, 108, 81, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                    ),
                    new Text(
                      '赋',
                      style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        color: Color.fromRGBO(187, 108, 81, 1),
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 200.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // new Text(
                //   '微信登陆',
                //   style: TextStyle(
                //     fontSize: 30,
                //     decoration: TextDecoration.none,
                //     color: Color.fromRGBO(187, 108, 81, 1),
                //   ),
                // ),
                // Image(
                //   image: NetworkImage(
                //       "http://thyrsi.com/t6/677/1551865976x2728278638.png"),
                //   height: 50,
                // ),
                new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/my');
                    },
                    child: Image(
                      image: NetworkImage(
                          "http://thyrsi.com/t6/677/1551865976x2728278638.png"),
                      height: 50,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // new Text(
                //   'qq登录',
                //   style: TextStyle(
                //     fontSize: 30,
                //     decoration: TextDecoration.none,
                //     color: Color.fromRGBO(187, 108, 81, 1),
                //   ),
                // ),
                // Image(
                //   image: NetworkImage(
                //       "http://thyrsi.com/t6/677/1551866431x2728278638.png"),
                //   height: 50,
                // ),
                new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/my');
                    },
                    child: Image(
                      image: NetworkImage(
                          "http://thyrsi.com/t6/677/1551866431x2728278638.png"),
                      height: 50,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      "http://thyrsi.com/t6/677/1551863332x1822611209.png"),
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                ),
                new Text(
                  '同意太合用户协议',
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(187, 108, 81, 0.6),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      "http://thyrsi.com/t6/677/1551863126x2890149584.png"),
                  width: 17.0,
                ),
                new Text(
                  '反馈',
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(187, 108, 81, 0.4),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
