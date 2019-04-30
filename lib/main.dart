import 'package:flutter/material.dart';
import './swiper.dart';
import './login.dart';
import './my.dart';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
  // SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent
  // ));
  if (Platform.isAndroid) {
    // SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
    //   statusBarColor: new Color(0x00000000)
    // ));
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  //该应用程序继承了StatelessWidget，这将会使应用本身也成为一个widget。
  //Stateless widgets是不可变的，意味着属性不可改变，所有的值都是最终的
  //在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)
  @override
  Widget build(BuildContext context) {
    //Widget提供了一个build()方法，描述如何根据其他较低级别的widget来显示自己
    return new MaterialApp(
      title: '音赋',
      home: new HomePage(),
      routes: {
        '/my': (BuildContext context) => new MyPage(),
        '/login': (BuildContext context) => new LoginPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // 底部导航
  Widget _buildBottomBar(BuildContext context) {
    GestureDetector buildButtonColumn(IconData icon, String label, int index) {
      // Color color = Theme.of(context).primaryColor;
      Color color = Colors.white;
      return new GestureDetector(
        onTap: () {
          //
        },
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Icon(icon, color: color),
            new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: color,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      );
    }

    return new Container(
      // width: MediaQuery.of(context).size.width,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.home, '音乐', 0),
          buildButtonColumn(Icons.video_library, '视频', 1),
          buildButtonColumn(Icons.near_me, '发现', 2),
          buildButtonColumn(Icons.share, '动态', 3),
          buildButtonColumn(Icons.account_circle, '我', 4),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height +
            MediaQuery.of(context).padding.top),
        child: MusicPage());
  }
}
