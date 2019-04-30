import 'package:flutter/material.dart';
import './comment.dart';
import './my.dart';
//import './share.dart';


class RightBarWidget extends StatefulWidget {
  final List<Comment> comments;
  RightBarWidget(this.comments);
  @override
  _RightBarWidgetState createState() => _RightBarWidgetState();
}

class _RightBarWidgetState extends State<RightBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector buildButton(Image image, String label){

    }
    GestureDetector buildButtonColumn(String imageUrl, String label) {
      Color color = Colors.white;
      return new GestureDetector(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset(imageUrl),
            // new Icon(icon, color: color),
            new Container(
              margin: const EdgeInsets.only(bottom: 18.0),
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
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: buildButtonColumn('images/btn_normal_like.png', '11.2w'),
            onTap: () {
              print('收藏');
            },
          ),
          GestureDetector(
            child: buildButtonColumn('images/btn_normal_download.png', '1175'),
            onTap: () {
              print('下载');
              showBottomSheet(
                  context: context, builder: (context) => CommentList(this.widget.comments));
            },
          ),
          GestureDetector(
            child: buildButtonColumn('images/btn_normal_comment.png', '1175'),
            onTap: () {
              print('评论');
              showBottomSheet(
                  context: context, builder: (context) => CommentList(this.widget.comments));
            },
          ),
          GestureDetector(
            child: buildButtonColumn('images/btn_normal_share.png', ''),
            onTap: () {
              print('分享');
              Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return new Scaffold(
                    appBar: new AppBar(
                      title: new Text('list detail'),
                    ),
                    //body: new SharePage(),
                    body: new Container(),

                  );
                },
              ),
            );
            },
          ),
        ],
      ),
    );
  }
}
