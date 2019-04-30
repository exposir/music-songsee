import 'package:flutter/material.dart';
import 'dart:async'; //Timer需要
import './audiocoreplugin.dart';


class LrcWidget extends StatefulWidget {
  @override
  LrcWidget({Key key, this.lrcTxt, this.callback}) :super(key:key) ;
  // LrcWidget({Key key, this.lrcTxt}) :super(key:key);
  final callback;
  String lrcTxt = ""; //父级传的歌词内容

  _LrcWidgetState createState() => _LrcWidgetState();

}

class _LrcWidgetState extends State<LrcWidget> {

  AudiocoreManager audiocore = AudiocoreManager.instance;  
  int time = 0;
  Timer _timer;
  String lrc = ""; //记录歌词
  List<List> lrcShow = List(); //实际要展示的歌词 歌词[当前毫秒数, 歌词内容]
  String lrcStats = ""; //记录歌词状态 single-lrc(歌词不完整)/txt-lrc(不支持自动滚动)/no-lrc(无歌词)
  String curLrc = ""; //展示当前时间 对应的歌词
  int line = 3; //展示几行
  int now = -2; //当前播放歌词位置
List<String> curLrcSpanArr = [];

  RegExp splitReg = new RegExp(r"(\n|\r)"),
    txtReg = new RegExp(r"(\[[\s\S]*?\])"),
    // timeReg = new RegExp(r"(\[\d{2,}:\d{2}(?:[\.|:]\d{2,5})?\])g"),
    timeReg = new RegExp(r"(\[\d{2,}:\d{2}(?:[\.|:]\d{2,5})?\])"),
    offsetReg = new RegExp(r"(\[offset:[+|\-]?\d+?(?=\]))");
  isLrc(str){
    return timeReg.hasMatch(str);
  }
  time2ms(time){
    List t = time.split(":");
    var m = t[0],
        s,
        ms;
    if (t.length == 3) {
        s = t[1];
        ms = t[2];
    } else {
        t = t[1].split(".");
        s = t[0];
        ms = t[1];
    }
    return int.parse(m) * 60 * 1000 + int.parse(s) * 1000 + int.parse(ms);
  }

  // var stopwatch = new Stopwatch();

  @override
  void initState() {
    // 可以在 initState中通过widget.lrcTxt拿到值
    super.initState();
    if(lrcShow.length>0) {
      lrcShow.removeRange(0,lrcShow.length-1);
    }
    setState(() {
      lrcShow = _parse();
    });
  
    if(lrcStats == "single-lrc" || lrcStats == "txt-lrc" || lrcStats == "no-lrc"){
      curLrc = "";
      // getCurLrcSpanArr("");
      return;
    }else {
      startTime();
    }
  }

  @override
  void didChangeDependencies()  {
    super.didChangeDependencies();
    lrcShow = _parse();
  }

  @override
  void dispose() {
    stopTime();
    super.dispose();
  }
  // 播放器返回时间点
  _getPos() async {
    int nPos = await audiocore.getPlayingPos();
    scrollToFn(nPos);
  }

  // 计时器开始
  void startTime() {
    curLrc = "";
    // getCurLrcSpanArr("");
    stopTime();
    // stopwatch.start();
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer){
      time += 1;
      _getPos();
      // print("定时器的timerrrr=$time,curlrc=$curLrc");
    });

  }
  //清楚定时器
  void stopTime() {
    curLrc = "";
    // getCurLrcSpanArr("");
    time = 0;
    
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = null;
    // stopwatch.stop();
  }

  _parse() {
    String lrc = widget.lrcTxt;
    String data = lrc.trim();
    List<List> arr = List();
    if (data.isEmpty) {
        lrcStats = "no-lrc";
    } else {
        if (isLrc(data)) {
            arr = _parseLrc(data);
        } else {
          arr = _parseTxt(data);
        }
    }
    if (arr.length < 1) {
        arr.add([0, "暂无歌词"]);
        lrcStats = "no-lrc";
    }
    return arr;
  }

  // 带时间戳的歌词
  _parseLrc(lrc) {
    List<List> r = List();

    int offset = 0;
    Iterable<Match> matches = offsetReg.allMatches(lrc);
    if(matches.toList().length >0) {
      matches.toList().forEach((item) { //获取歌词offset的值
        String itemstr = item.group(0);
        offset = int.parse(itemstr.substring(8));
      });
    }

    List<String> arr = lrc.split(splitReg);
    if(arr.length > 0) {
      arr.forEach( (line){ //解析每一句歌词 如：[00:17.92]【孟美岐】每天起床第一句 先给自己打个气
        Iterable<Match> items = timeReg.allMatches(line); //解析时间字段 如：[00:17.92]
        List listItems = items.toList();
        listItems.forEach( (item) {
          String timestr = item.group(0);
          int time = time2ms(timestr.substring(1, timestr.length -1)) + offset; //每一句歌词时间转成毫秒
          String txt = line.substring(timestr.length);
          if(time >0 && txt.length > 0){
              r.add([time, txt]);
          }
        });
      });
    }

    if (r.length > 0) {
      if (r.length == 1) {
        lrcStats = "single-lrc";
      } else {
        lrcStats = "lrc";
      }
      r.sort((a, b) {
        return a[0] - b[0];
      });
    } else {
      lrcStats = "no-lrc";
    }
    return r;
}

  // 没有时间戳
  _parseTxt(lrc) {
    List<List> r = List();
    List lines = lrc.replaceAll(txtReg, "").split(splitReg);
    lines.forEach( (line) {
      line = line.trim();
      if (line.length > 0) {
          r.add([-1, line]);
      }
    }
  );

  if (r.length > 0) {
      if (r.length == 1) {
          lrcStats = "single-lrc";
      } else {
          r.insert(0,[-1, "*该歌词暂不支持自动滚动*"]);
          lrcStats = "txt-lrc";
      }
  } else {
      lrcStats = "no-lrc";
  }
  return r;
}

_findLine(ms) {
    // List<List> parsed = lrcShow;
    if (lrcShow.length < 1) {
        return -1;
    }
    int head = 0;
    int tail = lrcShow.length;
    int mid = tail ~/ 2;
    getTime (pos) {
      if(pos < 0) {
        pos = 0;
      }else if(pos >= lrcShow.length) {
        pos = lrcShow.length -1;
      }
      int res = 36000000;
      List item = lrcShow[pos];
      if(item.length > 0) {
        res = item[0];
      } 
      return res;
      
    }
    if (ms < getTime(0)) {
        return -1;
    }

    while (true) {
        if (ms < getTime(mid)) {
          tail = mid - 1;
        } else {
          head = mid + 1;
        }
        mid = (head + tail) ~/ 2;
        if (ms >= getTime(mid) && ms < getTime(mid + 1)) {
          break;
        }
    }
    return mid;
}


scrollToFn(ms) {
  if (ms == null || ms < 0 ) {
    return false;
  }

  int line = _findLine(ms);
  if (now == line) return false;
  if (line == -1) {
    curLrc = lrcShow[0][1];
    // getCurLrcSpanArr(lrcShow[0][1]);
    widget.callback(curLrc);
    return false;
  }
  now = line;
  curLrc = lrcShow[line][1];
  
  // getCurLrcSpanArr(lrcShow[line][1]);
  widget.callback(curLrc);
}


void getCurLrcSpanArr(str){
  if(str.isNotEmpty) {
    curLrcSpanArr = [];
    List arr = str.split("");
    for(var i=0;i<arr.length;i++){
      curLrcSpanArr.add(arr[i]);
    }
  }
}
Widget _curLrcSpanArr(BuildContext context, int index){
  print(curLrcSpanArr[index]);
  return Text(curLrcSpanArr[index],
      style: TextStyle(
        color: Color(0xFFffffff),
        fontSize: 28.0,
        height: 1.1,
        fontWeight: FontWeight.bold,
        fontFamily: "HanSerif",
        decoration: TextDecoration.none,
      ),
    );
}


  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: new BoxConstraints(
        maxWidth: (MediaQuery.of(context).size.width / 8) * 7,
        // maxHeight: MediaQuery.of(context).size.height / 3
      ),
      margin:new EdgeInsets.only(top: 180.0,left: 20.0),
      height: 300,
      child: RotatedBox(
        quarterTurns: 0, //旋转90度(1/4圈)
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Text("$curLrc",
              maxLines: 4,
              style: TextStyle(
                color: Color(0xFFffffff),
                fontSize: 28.0,
                height: 1.1,
                fontWeight: FontWeight.bold,
                fontFamily: "HanSerif",
                decoration: TextDecoration.none,
              ),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),        
      )
    );
    // return new Container(
    //   constraints: new BoxConstraints(
    //     // maxWidth: 200.0,
    //     // maxHeight: MediaQuery.of(context).size.height / 3
    //   ),
    //   width: 300,
    //   height: 400,
    //   margin:new EdgeInsets.only(top: 150.0),
    //   child: RotatedBox(
    //     quarterTurns: 0,
    //     child: ListView.builder(
    //       itemCount: curLrcSpanArr.length,
    //       itemBuilder: (context,index){
    //         return Container(
    //           child:Column(
    //             children: <Widget>[
    //               new Text(curLrcSpanArr[index],
    //                 style: TextStyle(
    //                   color: Color(0xFFffffff),
    //                   fontSize: 28.0,
    //                   height: 1.1,
    //                   fontWeight: FontWeight.bold,
    //                   fontFamily: "HanSerif",
    //                   decoration: TextDecoration.none,
    //                 ),
    //               )
    //             ]
    //           )
    //         );
    //       },
    //     )
        
    //   )
      
    // );
  }
}
