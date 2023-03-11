import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:task/order_list_screen.dart';
import 'package:http/http.dart' as http;
import 'package:task/shared/shared_components.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String? userToken;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // requestPermission();
    //getToken();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Align(
        alignment: AlignmentDirectional.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: defaultButton(text:'Start',
          function: (){Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const OrderListScreen()));} )
        ),
      ),
    );
  }
  void requestPermission() async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('User granted permission');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('User granted provisional permission');
    }else{
      print('User declined or has not accepted permission');
    }
  }

  void getToken() async{
    await FirebaseMessaging.instance.getToken().then((token) {
      setState((){
        userToken = token;
      });
    });
  }

  void sendPushMessage(String token) async
  {
    try{
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>
        {
          'Content-Type':'',
          'Authorization':''
        },
        body:jsonEncode(
        <String, dynamic>{
          'priority':'high',
          'data':<String,dynamic>{
            'click_action':'FLUTTER_NOTIFICATION_CLICK',
            'status':'done',
            'body': "you are on your way",
            'title': "deliver"
          },
          "notification" : <String, dynamic>{
            "title":"deliver",
            "body": "you are on your way"
          },
          "to":token
        })
      );
    }catch(e){
    }
  }

}
