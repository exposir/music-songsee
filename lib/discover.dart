import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DiscoverPageState();
  }
}
class _DiscoverPageState extends State<DiscoverPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top),
      child: new Text('发现页面'),
    );    
  }
}