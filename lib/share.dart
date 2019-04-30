import 'package:flutter/material.dart';
//import 'package:sharesdk/sharesdk.dart';


class SharePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SharePageState();
  }
}
class _SharePageState extends State<SharePage> {
  @override
  void initState() {
      print('----------niu');
      // TODO: implement initState
      // ShareSDKRegister register = ShareSDKRegister();

      // register.setupWechat(
      //     "wx617c77c82218ea2c", "c7253e5289986cf4c4c74d1ccc185fb1");
      // register.setupSinaWeibo("3045448827", "760e721aa6c1cd49b3d1c17a67d2366a",
      //     "http://www.sharesdk.cn");
      // register.setupQQ("101558630", "920c686a03f184f575b4600a0313d7f1");
      // register.setupFacebook(
      //     "1412473428822331", "a42f4f3f867dc947b9ed6020c2e93558", "shareSDK");
      // register.setupTwitter("viOnkeLpHBKs6KXV7MPpeGyzE",
      //     "NJEglQUy2rqZ9Io9FcAU9p17omFqbORknUpRrCDOK46aAbIiey", "http://mob.com");

      // //注册
      // ShareSDK.regist(register);
      

      super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {


    return new Column(
      children: <Widget>[
        RaisedButton(
            highlightColor: Color(0xFF020231),
            child: Text('show bottom sheet'),
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (_) => Container(
                      height: 274,
                      width: double.infinity,
                      //color: const Color(0xFF020231),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/bg_share.png"),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding:  const EdgeInsets.only(left:150,right:40),
                                //color: Colors.grey[500],
                                child: Text(
                                  "分享音乐",
                                  style:TextStyle(
                                    fontSize: 20,
                                 )
                              ),

                              ),
                              
                              FlatButton(
                                child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        'images/btn_normal_closed.png',
                                        height: 40,
                                    
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                  
                                  onPressed: () {
                                        Navigator.of(context).pop();
                                  }),
                            ],

                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                             children: <Widget>[
                              FlatButton(
                                  child: Column(
                                    
                                    children: <Widget>[
                                      Image.asset(
                                        'images/wechat.png',
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        padding:  const EdgeInsets.only(top:13,bottom: 13),
                                        child:Text('微信好友'), 
                                      ),
                                
                                    ],
                                  ),
                                  onPressed: () {
                                        Navigator.of(context).pop();
                                  }),
                              FlatButton(
                                    child: Column(
                                    
                                    children: <Widget>[
                                      Image.asset(
                                        'images/circle_of_friends.png',
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      
                                      Container(
                                        padding:  const EdgeInsets.only(top:13,bottom: 13),
                                        child:Text('朋友圈'),
                                      ),
                                      
                                
                                    ],
                                  ),
                                  onPressed: () {
                                       
                                  }),
                                FlatButton(
                                    child: Column(
                                    
                                    children: <Widget>[
                                      Image.asset(
                                        'images/QQ.png',
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                        Container(
                                        padding:  const EdgeInsets.only(top:13,bottom: 13),
                                        child:Text('QQ'),
                                      ),
                                      
                                
                                    ],
                                  ),
                                  onPressed: () {
                                        //SSDKMap params = SSDKMap()..setGeneral("text哈哈哈哈","", http://ww1.sinaimg.cn/mw690/006dJESWgw1f6iyb8bzraj31kw0v67a2.jpg, null, null, "http://www.bai.com", "titlehahaha", SSDKContentTypes.text);
                                        //QQ平台定制的分享方法
                                        //params.setQQ("text", "title", "http://www.bai.com", null, null, null , "http://ww1.sinaimg.cn/mw690/006dJESWgw1f6iyb8bzraj31kw0v67a2.jpg", SSDKContentTypes.webpage, ShareSDKPlatforms.qZone);
                                        // 指定平台分享
                                      
                                      // ShareSDK.auth(ShareSDKPlatforms.qq, null, (SSDKResponseState state, Map user, SSDKError error){
                                      //   //   showAlert(state, user != null ? user:error.rawData, context);
                                      //   print("error is $error");
                                      // });
                                      // SSDKMap params = SSDKMap()..setGeneral("qqniuniu", "text", "images", "imageUrlAndroid", "imagePathAndroid", "url", "titleUrlAndroid", "musicUrlAndroid", "videoUrlAndroid", SSDKContentTypes.auto);

                                      // ShareSDK.share(ShareSDKPlatforms.qq, params, (SSDKResponseState state, Map userdata, Map contentEntity, SSDKError error){
                                      //   print('error =======$error');
                                      // });
                                  }),
                                  FlatButton(
                                    child: Column(
                                    
                                    children: <Widget>[
                                      Image.asset(
                                        'images/QQzone.png',
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                        Container(
                                        padding:  const EdgeInsets.only(top:13,bottom: 13),
                                        child:Text('QQ空间'),
                                      ),
                                      
                                
                                    ],
                                  ),
                                  onPressed: () {
                                        Navigator.of(context).pop();
                                  }),
                                ],

                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: <Widget>[
                              FlatButton(
                                  child: Column(
                                    
                                    children: <Widget>[
                                      Image.asset(
                                        'images/weibo.png',
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                     Container(
                                        padding:  const EdgeInsets.only(top:13,bottom: 13),
                                        child:Text('微博'), 
                                      ),
                                
                                    ],
                                  ),
                                  onPressed: () {
                                      //   ShareSDK.auth(ShareSDKPlatforms.sina, null, (SSDKResponseState state, Map user, SSDKError error){
                                      //   //   showAlert(state, user != null ? user:error.rawData, context);
                                      //   print("error is $error");
                                      // });
                                      // SSDKMap params = SSDKMap()..setGeneral("qqniuniu", "text", "images", "imageUrlAndroid", "imagePathAndroid", "url", "titleUrlAndroid", "musicUrlAndroid", "videoUrlAndroid", SSDKContentTypes.auto);

                                      // ShareSDK.share(ShareSDKPlatforms.sina, params, (SSDKResponseState state, Map userdata, Map contentEntity, SSDKError error){
                                      //   print('error =======$error');
                                      // });
                                  }),
                              FlatButton(
                                    child: Column(
                                    
                                    children: <Widget>[
                                      Image.asset(
                                        'images/video.png',
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        padding:  const EdgeInsets.only(top:13,bottom: 13),
                                        child:Text('分享视频'), 
                                      ),
                                      
                                
                                    ],
                                  ),
                                  onPressed: () {
                                     
                                  }),
                                 FlatButton(
                                    child: Column(
                                    
                                  ),
                                   onPressed: () {
                                     
                                  }
                                  ),
                                 FlatButton(
                                    child: Column(
                                   
                                  ),
                                  onPressed: () {
                                     
                                  }),
                          
                                ],

                          ),

                          
                        ],
                      ),
                    ))),
      ],
      
            
    );
    
  }
  // @override
  // void initState() {
  //     print('----------niu');
  //     // TODO: implement initState
  //     ShareSDKRegister register = ShareSDKRegister();

  //     register.setupWechat(
  //         "wx617c77c82218ea2c", "c7253e5289986cf4c4c74d1ccc185fb1");
  //     register.setupSinaWeibo("3045448827", "760e721aa6c1cd49b3d1c17a67d2366a",
  //         "http://www.sharesdk.cn");
  //     register.setupQQ("101558630", "920c686a03f184f575b4600a0313d7f1");
  //     register.setupFacebook(
  //         "1412473428822331", "a42f4f3f867dc947b9ed6020c2e93558", "shareSDK");
  //     register.setupTwitter("viOnkeLpHBKs6KXV7MPpeGyzE",
  //         "NJEglQUy2rqZ9Io9FcAU9p17omFqbORknUpRrCDOK46aAbIiey", "http://mob.com");

  //     //注册
  //     ShareSDK.regist(register);
  //     //ShareSDK.share(platform, params, result)
      
     
  //    // SSDKMap params = //SSDKMap()..setGeneral("text",[],null, "title", SSDKContentTypes.auto);
  //     // SSDKMap params = SSDKMap()..setGeneral("title", "text", "images", "imageUrlAndroid", "imagePathAndroid", "url", "titleUrlAndroid", "musicUrlAndroid", "videoUrlAndroid", SSDKContentTypes.auto);
  //     // //List list = ShareSDKPlatforms();
  //     // ShareSDK.showMenu(null, params, (SSDKResponseState state, ShareSDKPlatform platform, Map userData, Map contentEntity, SSDKError error){
  //     //   //showAlert(state, error.rawData, context);
  //     // });   


  //     super.initState();
  // }
  
   

 


  
}