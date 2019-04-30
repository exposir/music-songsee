import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DynamicPageState();
  }
}
class _DynamicPageState extends State<DynamicPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top),
      child: new Text('动态页面'),
    ); 
  }
}